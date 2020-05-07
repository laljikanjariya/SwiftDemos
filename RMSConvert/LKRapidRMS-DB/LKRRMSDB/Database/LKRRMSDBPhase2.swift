//
//  LKRRMSDBPhase2.swift
//  LKRRMSDB
//
//  Created by Lalji on 05/12/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import LKRRMSNetwork
import CoreData

struct Phase2ResponseData : Decodable {

    let isCompleted : Bool?
    let itemPriceArray : [ItemPriceArray]?
    let itemDiscountMD2Array : [ItemDiscountMD2Array]?
    let itemDiscountMDArray : [ItemDiscountMDArray]?
    let totalRow : Int?


    enum CodingKeys: String, CodingKey {
        case isCompleted = "IsCompleted"
        case itemPriceArray = "ItemPriceArray"
        case itemDiscountMD2Array = "Item_Discount_MD2Array"
        case itemDiscountMDArray = "Item_Discount_MDArray"
        case totalRow = "TotalRow"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isCompleted = try values.decodeIfPresent(Bool.self, forKey: .isCompleted)
        itemPriceArray = try values.decodeIfPresent([ItemPriceArray].self, forKey: .itemPriceArray)
        itemDiscountMD2Array = try values.decodeIfPresent([ItemDiscountMD2Array].self, forKey: .itemDiscountMD2Array)
        itemDiscountMDArray = try values.decodeIfPresent([ItemDiscountMDArray].self, forKey: .itemDiscountMDArray)
        totalRow = try values.decodeIfPresent(Int.self, forKey: .totalRow)
    }


}

class LKRRMSDBPhase2: NSObject {
    func callPhase2Service() {
        callPhase2Service(skipIndex: "0")
    }
    private func callPhase2Service(skipIndex index:String){
        let dictParam = NSMutableDictionary()
        dictParam.setValue("1", forKey: "BranchId")
        dictParam.setValue("", forKey: "Code")
        dictParam.setValue("", forKey: "Type")
        print("call phase 2 service",Date())
        LKRRMSNetworkManager().initRequest(stringAction: "GetItemDetailList", Request: dictParam) { (data, response, error) in
            do {
                print("response phase 2 service",Date())
                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any]
                let dataString : String = (response["GetItemDetailListResult"] as! [String : Any]) ["Data"] as! String
                self.insertResponse(Data(dataString.utf8))
                
            } catch {
                print(error)
            }
        }
    }
    func insertResponse(_ data:Data) {
        LKRRMSDBLoader.shared.operationMain.addOperation {
            let responseData:Phase2ResponseData?
            let privateMOC = LKRRMSDBLoader.preivateMOC(withParent: LKRRMSDBLoader.shared.persistentContainer.viewContext)
            do {
                responseData = try? JSONDecoder().decode([Phase2ResponseData].self, from: data).first
//                self.inserItemPriceData(responseData!, into: privateMOC)
//                self.inserItemDiscountMDData(responseData!, into: privateMOC)
//                self.inserItemsDiscountMD2Data(responseData!, into: privateMOC)
//                self.linkItemsData(into: privateMOC)
                self.insertUsingFilter(responseData!, into: privateMOC)
            }
            print("Saving phase 2")
            LKRRMSDBUpdater.save(privateMOC)
            if !(responseData?.isCompleted)! {
                let totalRow = String(responseData!.totalRow!)
                self.callPhase2Service(skipIndex: totalRow)
            }
            else {
                LKRRMSDBPhase3().callPhase3Service()
                print("Saved phase 2")
            }
        }
    }
    func inserItemPriceData(_ responseData:Phase2ResponseData, into privateMOC:NSManagedObjectContext){
        print("Insert Item Price")
        for itemPrice in (responseData.itemPriceArray)! {
            let itemPriceDB:Item_Price_MD = LKRRMSDBUpdater.insertEntity(name: "Item_Price_MD", into: privateMOC) as! Item_Price_MD
            itemPrice.updateItemPriceDB(itemPriceDB)
        }
        
    }
    func inserItemDiscountMDData(_ responseData:Phase2ResponseData, into privateMOC:NSManagedObjectContext){
        print("Insert Item DiscountMD")
        for itemDiscountData in (responseData.itemDiscountMDArray)! {
            let itemDiscountDB:Item_Discount_MD = LKRRMSDBUpdater.insertEntity(name: "Item_Discount_MD", into: privateMOC) as! Item_Discount_MD
            itemDiscountData.updateItemDiscountDB(itemDiscountDB)
        }
        
    }
    func inserItemsDiscountMD2Data(_ responseData:Phase2ResponseData, into privateMOC:NSManagedObjectContext){
        print("Insert Item DiscountMD2")
        for itemDiscountData2 in responseData.itemDiscountMD2Array! {
            let itemDiscountDB2:Item_Discount_MD2 = LKRRMSDBUpdater.insertEntity(name: "Item_Discount_MD2", into: privateMOC) as! Item_Discount_MD2
            itemDiscountData2.updateItemDiscount2DB(itemDiscountDB2)
        }
    }
    func linkItemsData(into privateMOC:NSManagedObjectContext){
        print("Linking")
        let items = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: nil, from: privateMOC) as! [Item]
        for item in items {
            autoreleasepool {
            let predidatePrice = NSPredicate(format: "itemcode = %@",item.itemCode!)
            let itemPrices = LKRRMSDBUpdater.fetchEntity(name: "Item_Price_MD", condition: predidatePrice, from: privateMOC) as! [Item_Price_MD]
            for price in itemPrices {
                item.addToItemToPriceMd(price)
                price.priceToItem = item
            }
            
            let predidateDiscount = NSPredicate(format: "itemCode = %@",item.itemCode!)
            let itemDiscount = LKRRMSDBUpdater.fetchEntity(name: "Item_Discount_MD", condition: predidateDiscount, from: privateMOC) as! [Item_Discount_MD]
            for discount in itemDiscount {
                item.addToItemToDisMd(discount)
                discount.mdToItem = item
                
                let predidateDiscount2 = NSPredicate(format: "discountId = %@",discount.iDisNo!)
                let itemDiscount2 = LKRRMSDBUpdater.fetchEntity(name: "Item_Discount_MD2", condition: predidateDiscount2, from: privateMOC) as! [Item_Discount_MD2]
                for discount2 in itemDiscount2 {
                    discount2.md2Tomd = discount
                    discount.addToMdTomd2(discount2)
                }
            }
            }
        }
    }
    func insertUsingFilter(_ responseData:Phase2ResponseData, into privateMOC:NSManagedObjectContext){
        
        let itemPriceArray = responseData.itemPriceArray! as NSArray
        let itemDiscountArray = responseData.itemDiscountMDArray! as NSArray
        let itemDiscount2Array = responseData.itemDiscountMD2Array! as NSArray
        var itemCodes = itemPriceArray.value(forKey: "itemCode") as! NSArray
        itemCodes = itemCodes.addingObjects(from: (itemDiscountArray.value(forKey: "iTEMCode") as! NSArray) as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: (itemDiscount2Array.value(forKey: "iTEMCode") as! NSArray) as! [Any]) as NSArray
        let unique = NSSet(array: itemCodes as! [Any]).allObjects
        let predidateItems = NSPredicate(format: "itemCode IN (%@)",unique)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        request.predicate = predidateItems
        request.sortDescriptors = [NSSortDescriptor.init(key: "itemCode", ascending: true)]
        request.returnsObjectsAsFaults = false
        let items = LKRRMSDBUpdater.fetchEntity(fetchRequest: request, from: privateMOC) as! [Item]
        
        for item in items {
            autoreleasepool {
                let predidatePrice = NSPredicate(format: "itemCode = %@",item.itemCode!)
                let itemPrices = itemPriceArray.filtered(using: predidatePrice) as! [ItemPriceArray]
                for priceResponse in itemPrices {
                    let itemPriceDB:Item_Price_MD = LKRRMSDBUpdater.insertEntity(name: "Item_Price_MD", into: privateMOC) as! Item_Price_MD
                    priceResponse.updateItemPriceDB(itemPriceDB)
                    item.addToItemToPriceMd(itemPriceDB)
                    itemPriceDB.priceToItem = item
                }
                
                let predidateDiscount = NSPredicate(format: "iTEMCode = %@",item.itemCode!)
                let itemDiscount = itemDiscountArray.filtered(using: predidateDiscount) as! [ItemDiscountMDArray]
                for discountResponse in itemDiscount {
                    let itemDiscountDB:Item_Discount_MD = LKRRMSDBUpdater.insertEntity(name: "Item_Discount_MD", into: privateMOC) as! Item_Discount_MD
                    discountResponse.updateItemDiscountDB(itemDiscountDB)
                    item.addToItemToDisMd(itemDiscountDB)
                    itemDiscountDB.mdToItem = item
                    
                    let predidateDiscount2 = NSPredicate(format: "discountId = %@",itemDiscountDB.iDisNo!)
                    let itemDiscount2 = itemDiscount2Array.filtered(using: predidateDiscount2) as! [ItemDiscountMD2Array]
                    
                    for discount2Response in itemDiscount2 {
                        let itemDiscountDB2:Item_Discount_MD2 = LKRRMSDBUpdater.insertEntity(name: "Item_Discount_MD2", into: privateMOC) as! Item_Discount_MD2
                        discount2Response.updateItemDiscount2DB(itemDiscountDB2)
                        itemDiscountDB2.md2Tomd = itemDiscountDB
                        itemDiscountDB.addToMdTomd2(itemDiscountDB2)
                    }
                }
            }
        }
    }
}
