//
//  LKRRMSDBPhase3.swift
//  LKRRMSDB
//
//  Created by Lalji on 07/12/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import LKRRMSNetwork
import CoreData


struct Phase3ResponseData : Decodable {

    let discountMasterArray : [DiscountMasterArray]?
    let discountPrimaryArray : [DiscountPrimaryArray]?
    let discountSecondaryArray : [DiscountPrimaryArray]?
    let iTMTAXMDArray : [ITMTAXMDArray]?
    let isCompleted : Bool?
    let itemSizeArray : [ItemSizeArray]?
    let itemTicketArray : [ItemTicketArray]?
    let itemSupplierArray : [ItemSupplierArray]?
    let totalRow : Int?
    let variationArray : [VariationArray]?
    let variationItemArray : [VariationItemArray]?


    enum CodingKeys: String, CodingKey {
        case discountMasterArray = "DiscountMasterArray"
        case discountPrimaryArray = "DiscountPrimaryArray"
        case discountSecondaryArray = "DiscountSecondaryArray"
        case iTMTAXMDArray = "ITMTAX_MDArray"
        case isCompleted = "IsCompleted"
        case itemSizeArray = "ItemSizeArray"
        case itemTicketArray = "ItemTicketArray"
        case itemSupplierArray = "Item_SupplierArray"
        case totalRow = "TotalRow"
        case variationArray = "VariationArray"
        case variationItemArray = "VariationItemArray"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        discountMasterArray = try values.decodeIfPresent([DiscountMasterArray].self, forKey: .discountMasterArray)
        discountPrimaryArray = try values.decodeIfPresent([DiscountPrimaryArray].self, forKey: .discountPrimaryArray)
        discountSecondaryArray = try values.decodeIfPresent([DiscountPrimaryArray].self, forKey: .discountSecondaryArray)
        iTMTAXMDArray = try values.decodeIfPresent([ITMTAXMDArray].self, forKey: .iTMTAXMDArray)
        isCompleted = try values.decodeIfPresent(Bool.self, forKey: .isCompleted)
        itemSizeArray = try values.decodeIfPresent([ItemSizeArray].self, forKey: .itemSizeArray)
        itemTicketArray = try values.decodeIfPresent([ItemTicketArray].self, forKey: .itemTicketArray)
        itemSupplierArray = try values.decodeIfPresent([ItemSupplierArray].self, forKey: .itemSupplierArray)
        totalRow = try values.decodeIfPresent(Int.self, forKey: .totalRow)
        variationArray = try values.decodeIfPresent([VariationArray].self, forKey: .variationArray)
        variationItemArray = try values.decodeIfPresent([VariationItemArray].self, forKey: .variationItemArray)
    }


}
class LKRRMSDBPhase3: NSObject {
    func callPhase3Service() {
        callPhase3Service(skipIndex: "0")
    }
    private func callPhase3Service(skipIndex index:String){
        let dictParam = NSMutableDictionary()
        dictParam.setValue("1", forKey: "BranchId")
        dictParam.setValue("", forKey: "Code")
        dictParam.setValue("", forKey: "Type")
        print("call phase 3 service",Date())
        LKRRMSNetworkManager().initRequest(stringAction: "GetItemVariationList", Request: dictParam) { (data, response, error) in
            do {
                print("response phase 3 service",Date())
                let response = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : Any]
                let dataString : String = (response["GetItemVariationListResult"] as! [String : Any]) ["Data"] as! String
                
                
                //                    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("phase3.txt")
                //
                //                    do {
                //                        try Data(dataString.utf8).write(to: fileURL, options: .atomic)
                //                    } catch {
                //                        print(error)
                //                    }
                //
                //
                //                    let responseData = try JSONSerialization.jsonObject(with: Data(dataString.utf8), options: .allowFragments) as! NSArray
                //                    let responseDataDict = responseData.firstObject as! NSDictionary
                //                    print(responseDataDict.allKeys)
                self.insertResponse(Data(dataString.utf8))
                
            } catch {
                print(error)
            }
        }
    }
    func insertResponse(_ data:Data) {
        LKRRMSDBLoader.shared.operationMain.addOperation {
            let responseData:Phase3ResponseData?
            let privateMOC = LKRRMSDBLoader.preivateMOC(withParent: LKRRMSDBLoader.shared.persistentContainer.viewContext)
            do {
                responseData = try? JSONDecoder().decode([Phase3ResponseData].self, from: data).first
                self.insertUsingFilter(responseData!, into: privateMOC)
            }

            print("Saving phase 3")
            LKRRMSDBUpdater.save(privateMOC)
            if !(responseData?.isCompleted)! {
                let totalRow = String(responseData!.totalRow!)
                self.callPhase3Service(skipIndex: totalRow)
            }
            else {
                print("Saved phase 3")
                
                print("All phase configuration complited")
            }
        }
    }
    func insertUsingFilter(_ responseData:Phase3ResponseData, into privateMOC:NSManagedObjectContext){
        let discountMasterArray = (responseData.discountMasterArray! as NSArray)
        let discountPrimaryArray = (responseData.discountPrimaryArray! as NSArray)
        let discountSecondaryArray = (responseData.discountSecondaryArray! as NSArray)
        let iTMTAXMDArray = (responseData.iTMTAXMDArray! as NSArray)
        let itemSizeArray = (responseData.itemSizeArray! as NSArray)
        let itemTicketArray = (responseData.itemTicketArray! as NSArray)
        let itemSupplierArray = (responseData.itemSupplierArray! as NSArray)
        let variationArray = (responseData.variationArray! as NSArray)
        let variationItemArray = (responseData.variationItemArray! as NSArray)

        
        var itemCodes = discountPrimaryArray.value(forKey: "itemCode") as! NSArray
        itemCodes = itemCodes.addingObjects(from: discountSecondaryArray.value(forKey: "itemCode") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: iTMTAXMDArray.value(forKey: "iTEMCode") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: itemSizeArray.value(forKey: "itemId") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: itemTicketArray.value(forKey: "itemCode") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: itemSupplierArray.value(forKey: "iTEMCODE") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: variationArray.value(forKey: "itemCode") as! [Any]) as NSArray
        itemCodes = itemCodes.addingObjects(from: variationItemArray.value(forKey: "itemCode") as! [Any]) as NSArray
        
        let unique = NSSet(array: itemCodes as! [Any]).allObjects
        let predidateItems = NSPredicate(format: "itemCode IN (%@)",unique)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
        request.predicate = predidateItems
        request.sortDescriptors = [NSSortDescriptor.init(key: "itemCode", ascending: true)]
        request.returnsObjectsAsFaults = false
        let items = LKRRMSDBUpdater.fetchEntity(fetchRequest: request, from: privateMOC) as! [Item]
        
        print("insert Variation, Ticket, Tag")
        for item in items {
            autoreleasepool {
                print("insert Variation")
                insertVariation(for: item, itemVariation: variationArray, forVariationItem: variationItemArray, into: privateMOC)
                
                insertItemTicket(for: item, itemTicket: itemTicketArray, into: privateMOC)
                
                insertItemTag(for: item, itemTag: itemSizeArray, into: privateMOC)
            }
        }
        insertItemSupplier(itemSupplierArray, into: privateMOC)
        insertItemTax(iTMTAXMDArray, into: privateMOC)
        
        insertItemDiscount(discountMasterArray, into: privateMOC)
        insertDiscountPrimaryItem(discountPrimaryArray, into: privateMOC)
        insertDiscountScondaryItem(discountSecondaryArray, into: privateMOC)
    }
    func insertVariation(for item:Item, itemVariation variationM:NSArray, forVariationItem variationMD:NSArray, into privateMOC:NSManagedObjectContext) {
        let predidateVariation = NSPredicate(format: "itemCode = %@",item.itemCode!)
        let itemVariation = variationM.filtered(using: predidateVariation) as! [VariationArray]
        for variationData in itemVariation{
            let itemVariation_M = LKRRMSDBUpdater.insertEntity(name: "ItemVariation_M", into: privateMOC) as! ItemVariation_M
            variationData.updateItemVariationDB(itemVariation_M)
            item.addToItemVariations(itemVariation_M)
            itemVariation_M.variationItem = item
            
            let predidateVariationMD = NSPredicate(format: "itemCode = %@",item.itemCode!)
            let itemVariationMD = variationMD.filtered(using: predidateVariationMD) as! [VariationItemArray]
            for variationMD in itemVariationMD {
                let itemVariation_Md = LKRRMSDBUpdater.insertEntity(name: "ItemVariation_Md", into: privateMOC) as! ItemVariation_Md
                variationMD.updateItemVariationMDDB(itemVariation_Md)
                itemVariation_M.addToVariationMVariationMds(itemVariation_Md)
                itemVariation_Md.variationMdVariationM = itemVariation_M
            }
            
            let predidateVariationMaster = NSPredicate(format: "vid = %@",itemVariation_M.variationMasterId!)
            let variationMasters = LKRRMSDBUpdater.fetchEntity(name: "Variation_Master", condition: predidateVariationMaster, from: privateMOC) as! [Variation_Master]
            for variationMaster in variationMasters {
                variationMaster.addToMasterVariationMs(itemVariation_M)
                itemVariation_M.variationMMaster = variationMaster
            }
        }
    }
    func insertItemTicket(for item:Item, itemTicket:NSArray, into privateMOC:NSManagedObjectContext) {
        let predidateVariation = NSPredicate(format: "itemCode = %@",item.itemCode!)
        let itemTickets = itemTicket.filtered(using: predidateVariation) as! [ItemTicketArray]
        for itemTicket in itemTickets{
            let itemTicketMD = LKRRMSDBUpdater.insertEntity(name: "ItemTicket_MD", into: privateMOC) as! ItemTicket_MD
            itemTicket.updateItemTicketDB(itemTicketMD)
            item.itemTicket = itemTicketMD
            itemTicketMD.ticketToItem = item
        }
    }
    func insertItemTag(for item:Item, itemTag:NSArray, into privateMOC:NSManagedObjectContext) {
        let predidateTag = NSPredicate(format: "itemId = %@",item.itemCode!)
        let itemTags = itemTag.filtered(using: predidateTag) as! [ItemSizeArray]
        for itemTag in itemTags{
            let itemTagDB = LKRRMSDBUpdater.insertEntity(name: "ItemTag", into: privateMOC) as! ItemTag
            itemTag.updateItemTagDB(itemTagDB)
            itemTagDB.addToTagToItem(item)
            item.addToItemTags(itemTagDB)
        }
    }
    func insertItemSupplier(_ itemSupplier:NSArray, into privateMOC:NSManagedObjectContext) {
        print("insert Item Supplier")
        let uniqueItemSuppliers = NSSet(array: itemSupplier as! [Any]).allObjects as! [ItemSupplierArray]
        for uniqueItemSupplier in uniqueItemSuppliers{
            let itemSupplierDB = LKRRMSDBUpdater.insertEntity(name: "ItemSupplier", into: privateMOC) as! ItemSupplier
            uniqueItemSupplier.updateItemSupplierDB(itemSupplierDB)
        }
    }
    func insertItemTax(_ itemTaxData:NSArray, into privateMOC:NSManagedObjectContext) {
        print("insert Item Tax")
        let uniqueItemTaxs = NSSet(array: itemTaxData as! [Any]).allObjects as! [ITMTAXMDArray]
        for uniqueItemTax in uniqueItemTaxs{
            let itemTaxDB = LKRRMSDBUpdater.insertEntity(name: "ItemTax", into: privateMOC) as! ItemTax
            uniqueItemTax.updateItemTaxDB(itemTaxDB)
        }

    }
    func insertItemDiscount(_ itemDiscountData:NSArray, into privateMOC:NSManagedObjectContext) {
        print("insert Item Discount")
        let uniqueItemDiscounts = NSSet(array: itemDiscountData as! [Any]).allObjects as! [DiscountMasterArray]
        for uniqueItemDiscount in uniqueItemDiscounts{
            let itemDiscountDB = LKRRMSDBUpdater.insertEntity(name: "Discount_M", into: privateMOC) as! Discount_M
            uniqueItemDiscount.updateItemDiscountDB(itemDiscountDB)
        }

    }
    func insertDiscountPrimaryItem(_ itemDiscountPrimaryData:NSArray, into privateMOC:NSManagedObjectContext) {
        print("insert Discount PrimaryItem")
        let uniqueDiscountPrimary = NSSet(array: itemDiscountPrimaryData as! [Any]).allObjects as! [DiscountPrimaryArray]
        for uniqueDiscountPrimary in uniqueDiscountPrimary{
            let itemDiscountPrimaryDB = LKRRMSDBUpdater.insertEntity(name: "Discount_Primary_MD", into: privateMOC) as! Discount_Primary_MD
            uniqueDiscountPrimary.updateDiscountPrimaryItemDB(itemDiscountPrimaryDB)
            
            let predidateItem = NSPredicate(format: "itemCode = %@",uniqueDiscountPrimary.itemCode!)
            let item = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: predidateItem, from: privateMOC, needToCreate: false) as? Item
            
            if item != nil {
                item?.addToPrimaryItemDetail(itemDiscountPrimaryDB)
                itemDiscountPrimaryDB.itemDetail = item
            }
            
            let predidateDiscount = NSPredicate(format: "discountId = %@",itemDiscountPrimaryDB.discountId!)
            let discount = LKRRMSDBUpdater.fetchEntity(name: "Discount_M", condition: predidateDiscount, from: privateMOC, needToCreate: false) as? Discount_M
            
            if discount != nil {
                discount?.addToPrimaryItems(itemDiscountPrimaryDB)
                itemDiscountPrimaryDB.primaryItem = discount
            }
        }
    }
    func insertDiscountScondaryItem(_ itemDiscountSecondaryData:NSArray, into privateMOC:NSManagedObjectContext) {
        print("insert Discount ScondaryItem")
        let uniqueDiscountSecondary = NSSet(array: itemDiscountSecondaryData as! [Any]).allObjects as! [DiscountPrimaryArray]
        for uniqueDiscountSecondary in uniqueDiscountSecondary{
            let itemDiscountSecondaryDB = LKRRMSDBUpdater.insertEntity(name: "Discount_Secondary_MD", into: privateMOC) as! Discount_Secondary_MD
            uniqueDiscountSecondary.updateDiscountSecondaryItemDB(itemDiscountSecondaryDB)
            
            let predidateItem = NSPredicate(format: "itemCode = %@",uniqueDiscountSecondary.itemCode!)
            let item = LKRRMSDBUpdater.fetchEntity(name: "Item", condition: predidateItem, from: privateMOC, needToCreate: false) as? Item
            
            if item != nil {
                item?.addToSecondaryItemDetail(itemDiscountSecondaryDB)
                itemDiscountSecondaryDB.itemDetail = item
            }
            
            let predidateDiscount = NSPredicate(format: "discountId = %@",itemDiscountSecondaryDB.discountId!)
            let discount = LKRRMSDBUpdater.fetchEntity(name: "Discount_M", condition: predidateDiscount, from: privateMOC, needToCreate: false) as? Discount_M
            
            if discount != nil {
                discount?.addToSecondaryItems(itemDiscountSecondaryDB)
                itemDiscountSecondaryDB.secondaryItem = discount
            }
        }
    }
    
}
