//
//  LKRRMSDBPhase1.swift
//  LKRapidRMS-DB-SLib
//
//  Created by Lalji on 29/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import LKRRMSNetwork
import CoreData

struct ResponseData : Decodable {

    let isCompleted : Bool?
    let itemArray : [ItemResponseModel]?
    let itemBarcodeArray : [ItemBarcodeResponseModel]?
    let totalRow : Int?
    let uTCTime : String?


    enum CodingKeys: String, CodingKey {
        case isCompleted = "IsCompleted"
        case itemArray = "ItemArray"
        case itemBarcodeArray = "ItemBarcodeArray"
        case totalRow = "TotalRow"
        case uTCTime = "UTCTime"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isCompleted = try values.decodeIfPresent(Bool.self, forKey: .isCompleted)
        itemArray = try values.decodeIfPresent([ItemResponseModel].self, forKey: .itemArray)
        itemBarcodeArray = try values.decodeIfPresent([ItemBarcodeResponseModel].self, forKey: .itemBarcodeArray)
        totalRow = try values.decodeIfPresent(Int.self, forKey: .totalRow)
        uTCTime = try values.decodeIfPresent(String.self, forKey: .uTCTime)
    }

}
class LKRRMSDBPhase1: NSObject {
    func callPhase1Service() {
        callPhase1Service(skipIndex: "0")
    }
    private func callPhase1Service(skipIndex index:String){
        let dictParam = NSMutableDictionary()
        dictParam.setValue("1", forKey: "BranchId")
        dictParam.setValue("", forKey: "Code")
        dictParam.setValue("", forKey: "Type")
        dictParam.setValue(index, forKey: "index")
        print("service phase 1",Date())
        LKRRMSNetworkManager().initRequest(stringAction: "GetItemList", Request: dictParam) { (data, response, error) in
            
            do {
                print("response phase 1",Date())
                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any]
                let dataString : String = (response["GetItemListResult"] as! [String : Any]) ["Data"] as! String
                self.insertResponse(Data(dataString.utf8))
                
            } catch {
                print(error)
            }
        }
    }
    func insertResponse(_ data:Data) {
        LKRRMSDBLoader.shared.operationMain.addOperation {
            let responseData:ResponseData?
            let privateMOC = LKRRMSDBLoader.preivateMOC(withParent: LKRRMSDBLoader.shared.persistentContainer.viewContext)
            do {
                responseData = try? JSONDecoder().decode([ResponseData].self, from: data).first
//                self.inserItemsData(responseData!, into: privateMOC)
//                self.inserItemsBarcodeData(responseData!, forItem: nil, into: privateMOC)
//                self.linkItemsBarcodeData(into: privateMOC)
                self.inserData(responseData!, into: privateMOC)
            }
            print("Saving phase 1")
            LKRRMSDBUpdater.save(privateMOC)
            if !(responseData?.isCompleted)! {
                let totalRow = String(responseData!.totalRow!)
                self.callPhase1Service(skipIndex: totalRow)
            }
            else{
                print("Saved phase 1")
                LKRRMSDBPhase2().callPhase2Service()
            }
        }
    }
    func inserData(_ responseData:ResponseData, into privateMOC:NSManagedObjectContext){
        print("Insert Item")
        let itemBarcodeArray = responseData.itemBarcodeArray! as NSArray
        
//        itemBarcodeArray = itemBarcodeArray.sortedArray(comparator: { (obj1:ItemBarcodeResponseModel, obj2:ItemBarcodeResponseModel) -> ComparisonResult in
//            if obj1.itemId!.intValue > obj2.itemId!.intValue {
//                return .orderedDescending
//            }
//            else {
//                return .orderedAscending
//            }
//            } as! (Any, Any) -> ComparisonResult) as NSArray
//
//
        for itemData in (responseData.itemArray)! {
            autoreleasepool {
                let predidate = NSPredicate(format: "itemCode = %d",itemData.iTEMCode!)
                let item = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: predidate, from: privateMOC, needToCreate: true) as! Item
                itemData.updateItemDB(item)
                
                let predidateDiscount = NSPredicate(format: "itemId = %@",item.itemCode!)
                let itemsBarcode = itemBarcodeArray.filtered(using: predidateDiscount) as! [ItemBarcodeResponseModel]
                for itembarcode in itemsBarcode {
                    let barcodeData:ItemBarCode_Md = LKRRMSDBUpdater.insertEntity(name: "ItemBarCode_Md", into: privateMOC) as! ItemBarCode_Md
                    itembarcode.updateItemBarcodeDB(barcodeData)
                    item.addToItemBarcodes(barcodeData)
                    barcodeData.barcodeItem = item;
                }
            }
        }
    }
    func inserItemsData(_ responseData:ResponseData, into privateMOC:NSManagedObjectContext){
        print("Insert Item")
        for itemData in (responseData.itemArray)! {
            let predidate = NSPredicate(format: "itemCode = %d",itemData.iTEMCode!)
            let item = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: predidate, from: privateMOC, needToCreate: true) as! Item
            itemData.updateItemDB(item)
        }

    }
    func inserItemsBarcodeData(_ responseData:ResponseData, forItem item:Item?, into privateMOC:NSManagedObjectContext){
        print("Insert ItemBarcode")
        for itembarcode in responseData.itemBarcodeArray! {
            let barcodeData:ItemBarCode_Md = LKRRMSDBUpdater.insertEntity(name: "ItemBarCode_Md", into: privateMOC) as! ItemBarCode_Md
            itembarcode.updateItemBarcodeDB(barcodeData)
//            itembarcode.linkItemBarcodeDBToItem(barcodeData, withItem: item)
        }
    }
    func linkItemsBarcodeData(into privateMOC:NSManagedObjectContext){
        print("Linking")
        let items = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: nil, from: privateMOC) as! [Item]
        for item in items {
            let predidate = NSPredicate(format: "itemCode = %@",item.itemCode!)
            let itemBarcodes = LKRRMSDBUpdater.fetchEntity(name: "ItemBarCode_Md", condition: predidate, from: privateMOC) as! [ItemBarCode_Md]
            for barcode in itemBarcodes {
                item.addToItemBarcodes(barcode)
                barcode.barcodeItem = item
            }
        }
    }
}
