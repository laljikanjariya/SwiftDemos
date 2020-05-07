//
//  ItemResponseModels.swift
//  LKRRMSDB
//
//  Created by Lalji on 05/12/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
// phose 1
//class filterModel: NSObject {
//    func sortArray(_ array:NSArray, for key:String) -> NSArray {
//        array.sortedArray { (obj1:AnyClass, obj2:AnyClass) -> ComparisonResult in
//            obj1.getValue(key)
//        }
//        return array;
//    }
//}
struct ItemResponseModel : Codable {
    let active : Bool?
    let avgCost : Float?
    let barcode : String?
    let branchId : Int?
    let cITMCode : String?
    let cashierNote : String?
    let catId : Int?
    let cateMixMatchFlg : Bool?
    let cateMixMatchId : Int?
    let childQty : Int?
    let code : String?
    let costPrice : Float?
    let deptId : Int?
    let descriptionField : String?
    let disCalcItm : Bool?
    let dispenserId : Int?
    let displayInPOS : Bool?
    let displayInSubDept : Bool?
    let eBT : Bool?
    let fuelTypeId : Int?
    let gameId : Int?
    let iTEMCode : Int?
    let iTEMDesc : String?
    let iTEMDiscount : Int?
    let iTEMInOrder : Int?
    let iTEMInStock : Int?
    let iTEMMaxStockLevel : Int?
    let iTEMMinStockLevel : Int?
    let iTEMNo : String?
    let iTEMRemarks : String?
    let iTMType : String?
    let isCaseFavourite : Bool?
    let isFavourite : Bool?
    let isFeeOrDeposit : Bool?
    let isNotDisplayInventory : Bool?
    let isPackFavourite : Bool?
    let isPriceAtPOS : Bool?
    let isShortCut : Bool?
    let isSingleFavourite : Bool?
    let isTicket : Bool?
    let isItemSupplier : Bool?
    let isduplicateUPC : Bool?
    let itemImagePath : String?
    let lastInvoice : String?
    let lastInvoiceDate : String?
    let lastReceivedDate : String?
    let lotteryId : Int?
    let memo : Bool?
    let mixMatchFlg : Bool?
    let mixMatchId : Int?
    let noDiscountFlg : Bool?
    let pERBOXQty : Int?
    let pOSDISCOUNT : Bool?
    let packId : Int?
    let priceScale : String?
    let profitAmt : Float?
    let profitType : String?
    let qtyDiscount : Bool?
    let salesPrice : Float?
    let salesVelocity : String?
    let sizeId : Int?
    let subDeptId : Int?
    let taxApply : Bool?
    let taxType : String?
    let weightQty : Float?
    let weightType : String?
    let isDeleted : Bool?
    let isItemPayout : Bool?
    let quantityManagementEnabled : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case active = "Active"
        case avgCost = "AvgCost"
        case barcode = "Barcode"
        case branchId = "BranchId"
        case cITMCode = "CITM_Code"
        case cashierNote = "CashierNote"
        case catId = "CatId"
        case cateMixMatchFlg = "Cate_MixMatchFlg"
        case cateMixMatchId = "Cate_MixMatchId"
        case childQty = "Child_Qty"
        case code = "Code"
        case costPrice = "CostPrice"
        case deptId = "DeptId"
        case descriptionField = "Description"
        case disCalcItm = "Dis_CalcItm"
        case dispenserId = "DispenserId"
        case displayInPOS = "DisplayInPOS"
        case displayInSubDept = "DisplayInSubDept"
        case eBT = "EBT"
        case fuelTypeId = "FuelTypeId"
        case gameId = "GameId"
        case iTEMCode = "ITEMCode"
        case iTEMDesc = "ITEM_Desc"
        case iTEMDiscount = "ITEM_Discount"
        case iTEMInOrder = "ITEM_InOrder"
        case iTEMInStock = "ITEM_InStock"
        case iTEMMaxStockLevel = "ITEM_MaxStockLevel"
        case iTEMMinStockLevel = "ITEM_MinStockLevel"
        case iTEMNo = "ITEM_No"
        case iTEMRemarks = "ITEM_Remarks"
        case iTMType = "ITM_Type"
        case isCaseFavourite = "IsCaseFavourite"
        case isFavourite = "IsFavourite"
        case isFeeOrDeposit = "IsFeeOrDeposit"
        case isNotDisplayInventory = "IsNotDisplayInventory"
        case isPackFavourite = "IsPackFavourite"
        case isPriceAtPOS = "IsPriceAtPOS"
        case isShortCut = "IsShortCut"
        case isSingleFavourite = "IsSingleFavourite"
        case isTicket = "IsTicket"
        case isItemSupplier = "Is_ItemSupplier"
        case isduplicateUPC = "IsduplicateUPC"
        case itemImagePath = "Item_ImagePath"
        case lastInvoice = "LastInvoice"
        case lastInvoiceDate = "LastInvoiceDate"
        case lastReceivedDate = "LastReceivedDate"
        case lotteryId = "LotteryId"
        case memo = "Memo"
        case mixMatchFlg = "MixMatchFlg"
        case mixMatchId = "MixMatchId"
        case noDiscountFlg = "NoDiscountFlg"
        case pERBOXQty = "PERBOX_Qty"
        case pOSDISCOUNT = "POS_DISCOUNT"
        case packId = "PackId"
        case priceScale = "PriceScale"
        case profitAmt = "Profit_Amt"
        case profitType = "Profit_Type"
        case qtyDiscount = "Qty_Discount"
        case salesPrice = "SalesPrice"
        case salesVelocity = "SalesVelocity"
        case sizeId = "SizeId"
        case subDeptId = "SubDeptId"
        case taxApply = "TaxApply"
        case taxType = "TaxType"
        case weightQty = "WeightQty"
        case weightType = "WeightType"
        case isDeleted = "isDeleted"
        case isItemPayout = "isItemPayout"
        case quantityManagementEnabled = "quantityManagementEnabled"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        active = try values.decodeIfPresent(Bool.self, forKey: .active)
        avgCost = try values.decodeIfPresent(Float.self, forKey: .avgCost)
        barcode = try values.decodeIfPresent(String.self, forKey: .barcode)
        branchId = try values.decodeIfPresent(Int.self, forKey: .branchId)
        cITMCode = try values.decodeIfPresent(String.self, forKey: .cITMCode)
        cashierNote = try values.decodeIfPresent(String.self, forKey: .cashierNote)
        catId = try values.decodeIfPresent(Int.self, forKey: .catId)
        cateMixMatchFlg = try values.decodeIfPresent(Bool.self, forKey: .cateMixMatchFlg)
        cateMixMatchId = try values.decodeIfPresent(Int.self, forKey: .cateMixMatchId)
        childQty = try values.decodeIfPresent(Int.self, forKey: .childQty)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        costPrice = try values.decodeIfPresent(Float.self, forKey: .costPrice)
        deptId = try values.decodeIfPresent(Int.self, forKey: .deptId)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        disCalcItm = try values.decodeIfPresent(Bool.self, forKey: .disCalcItm)
        dispenserId = try values.decodeIfPresent(Int.self, forKey: .dispenserId)
        displayInPOS = try values.decodeIfPresent(Bool.self, forKey: .displayInPOS)
        displayInSubDept = try values.decodeIfPresent(Bool.self, forKey: .displayInSubDept)
        eBT = try values.decodeIfPresent(Bool.self, forKey: .eBT)
        fuelTypeId = try values.decodeIfPresent(Int.self, forKey: .fuelTypeId)
        gameId = try values.decodeIfPresent(Int.self, forKey: .gameId)
        iTEMCode = try values.decodeIfPresent(Int.self, forKey: .iTEMCode)
        iTEMDesc = try values.decodeIfPresent(String.self, forKey: .iTEMDesc)
        iTEMDiscount = try values.decodeIfPresent(Int.self, forKey: .iTEMDiscount)
        iTEMInOrder = try values.decodeIfPresent(Int.self, forKey: .iTEMInOrder)
        iTEMInStock = try values.decodeIfPresent(Int.self, forKey: .iTEMInStock)
        iTEMMaxStockLevel = try values.decodeIfPresent(Int.self, forKey: .iTEMMaxStockLevel)
        iTEMMinStockLevel = try values.decodeIfPresent(Int.self, forKey: .iTEMMinStockLevel)
        iTEMNo = try values.decodeIfPresent(String.self, forKey: .iTEMNo)
        iTEMRemarks = try values.decodeIfPresent(String.self, forKey: .iTEMRemarks)
        iTMType = try values.decodeIfPresent(String.self, forKey: .iTMType)
        isCaseFavourite = try values.decodeIfPresent(Bool.self, forKey: .isCaseFavourite)
        isFavourite = try values.decodeIfPresent(Bool.self, forKey: .isFavourite)
        isFeeOrDeposit = try values.decodeIfPresent(Bool.self, forKey: .isFeeOrDeposit)
        isNotDisplayInventory = try values.decodeIfPresent(Bool.self, forKey: .isNotDisplayInventory)
        isPackFavourite = try values.decodeIfPresent(Bool.self, forKey: .isPackFavourite)
        isPriceAtPOS = try values.decodeIfPresent(Bool.self, forKey: .isPriceAtPOS)
        isShortCut = try values.decodeIfPresent(Bool.self, forKey: .isShortCut)
        isSingleFavourite = try values.decodeIfPresent(Bool.self, forKey: .isSingleFavourite)
        isTicket = try values.decodeIfPresent(Bool.self, forKey: .isTicket)
        isItemSupplier = try values.decodeIfPresent(Bool.self, forKey: .isItemSupplier)
        isduplicateUPC = try values.decodeIfPresent(Bool.self, forKey: .isduplicateUPC)
        itemImagePath = try values.decodeIfPresent(String.self, forKey: .itemImagePath)
        #warning("TODO: Convert to date object")
        lastInvoice = try values.decodeIfPresent(String.self, forKey: .lastInvoice)
        lastInvoiceDate = try values.decodeIfPresent(String.self, forKey: .lastInvoiceDate)
        lastReceivedDate = try values.decodeIfPresent(String.self, forKey: .lastReceivedDate)
        lotteryId = try values.decodeIfPresent(Int.self, forKey: .lotteryId)
        memo = try values.decodeIfPresent(Bool.self, forKey: .memo)
        mixMatchFlg = try values.decodeIfPresent(Bool.self, forKey: .mixMatchFlg)
        mixMatchId = try values.decodeIfPresent(Int.self, forKey: .mixMatchId)
        noDiscountFlg = try values.decodeIfPresent(Bool.self, forKey: .noDiscountFlg)
        pERBOXQty = try values.decodeIfPresent(Int.self, forKey: .pERBOXQty)
        pOSDISCOUNT = try values.decodeIfPresent(Bool.self, forKey: .pOSDISCOUNT)
        packId = try values.decodeIfPresent(Int.self, forKey: .packId)
        priceScale = try values.decodeIfPresent(String.self, forKey: .priceScale)
        profitAmt = try values.decodeIfPresent(Float.self, forKey: .profitAmt)
        profitType = try values.decodeIfPresent(String.self, forKey: .profitType)
        qtyDiscount = try values.decodeIfPresent(Bool.self, forKey: .qtyDiscount)
        salesPrice = try values.decodeIfPresent(Float.self, forKey: .salesPrice)
        salesVelocity = try values.decodeIfPresent(String.self, forKey: .salesVelocity)
        sizeId = try values.decodeIfPresent(Int.self, forKey: .sizeId)
        subDeptId = try values.decodeIfPresent(Int.self, forKey: .subDeptId)
        taxApply = try values.decodeIfPresent(Bool.self, forKey: .taxApply)
        taxType = try values.decodeIfPresent(String.self, forKey: .taxType)
        weightQty = try values.decodeIfPresent(Float.self, forKey: .weightQty)
        weightType = try values.decodeIfPresent(String.self, forKey: .weightType)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        isItemPayout = try values.decodeIfPresent(Bool.self, forKey: .isItemPayout)
        quantityManagementEnabled = try values.decodeIfPresent(Bool.self, forKey: .quantityManagementEnabled)
    }
    public func updateItemDB(_ item:Item) {
        item.active = NSNumber(value: active ?? true)
        item.averageCost = NSNumber(value:avgCost!)
        item.barcode = barcode
        item.branchId = NSNumber(value:branchId!)
        item.citm_Code = NSNumber(value:(cITMCode! as NSString).intValue)
        item.cashierNote = cashierNote
        item.catId = NSNumber(value: catId!)
        item.cate_MixMatchFlg = NSNumber(value: cateMixMatchFlg!)
        item.cate_MixMatchId = NSNumber(value: cateMixMatchId!)
        item.child_Qty = NSNumber(value: childQty!)
//        item.code = code
        item.costPrice = NSNumber(value: costPrice!)
        item.deptId = NSNumber(value: deptId!)
//        item.descriptionField = descriptionField
        item.dis_CalcItm = NSNumber(value: disCalcItm!)
//        item.dispenserId = dispenserId
        item.isDisplayInPos = NSNumber(value: displayInPOS!)
        item.isDisplayInSubDept = NSNumber(value: displayInSubDept!)
        item.eBT = NSNumber(value: eBT!)
//        item.fuelTypeId = fuelTypeId
//        item.gameId = gameId
        item.itemCode = NSNumber(value: iTEMCode!)
        item.item_Desc = iTEMDesc
        item.item_Discount = NSNumber(value: iTEMDiscount!)
//        item.iTEMInOrder = iTEMInOrder
        item.item_InStock = NSNumber(value: iTEMInStock!)
        item.item_MaxStockLevel = NSNumber(value: iTEMMaxStockLevel!)
        item.item_MinStockLevel = NSNumber(value: iTEMMinStockLevel!)
        item.item_No = iTEMNo
        item.item_Remarks = iTEMRemarks
        item.itm_Type = iTMType
//        item.isCaseFavourite = isCaseFavourite
        item.isFavourite = NSNumber(value: isFavourite!)
        item.isFeeOrDeposit = NSNumber(value: isFeeOrDeposit!)
        item.isNotDisplayInventory = NSNumber(value: isNotDisplayInventory!)
//        item.isPackFavourite = isPackFavourite
        item.isPriceAtPOS = NSNumber(value: isPriceAtPOS!)
        item.isShortcutInPos = NSNumber(value: isShortCut!)
//        item.isSingleFavourite = isSingleFavourite
        item.isTicket = NSNumber(value: isTicket!)
//        item.isItemSupplier = isItemSupplier
        item.isDuplicateBarcodeAllowed = NSNumber(value: isduplicateUPC!)
        item.item_ImagePath = itemImagePath
        item.lastInvoice = lastInvoice
        #warning("TODO: Set to date object")
//        item.lastSoldDate = lastInvoiceDate
//        item.lastReceivedDate = lastReceivedDate
        
//        item.lotteryId = lotteryId
        item.memo = NSNumber(value: memo!)
        item.mixMatchFlg = NSNumber(value: mixMatchFlg!)
        item.mixMatchId = NSNumber(value: mixMatchId!)
        item.noDiscountFlg = NSNumber(value: noDiscountFlg!)
        item.perbox_Qty = NSNumber(value: pERBOXQty!)
        item.pos_DISCOUNT = NSNumber(value: pOSDISCOUNT!)
//        item.packId = packId
        item.pricescale = priceScale
        item.profit_Amt = NSNumber(value:Double(profitAmt!))
        item.profit_Type = profitType
        item.qty_Discount = NSNumber(value: qtyDiscount!)
        item.salesPrice = NSNumber(value:Double(salesPrice!))
        item.salesVelocity = salesVelocity
//        item.sizeId = sizeId
        item.subDeptId = NSNumber(value: subDeptId!)
        item.taxApply = NSNumber(value: taxApply!)
        item.taxType = taxType
        item.weightqty = NSNumber(value:weightQty!)
        item.weightype = weightType
        item.isDelete = NSNumber(value: isDeleted!)
        item.isItemPayout = NSNumber(value: isItemPayout!)
        item.quantityManagementEnabled = NSNumber(value: quantityManagementEnabled!)
    }
}
public class ItemBarcodeResponseModel : NSObject, Decodable{
    
    let barCode : String?
    let isDefault : Bool?
    let isDeleted : Bool?
    let isUPCAutoGenerated : Bool?
    @objc let itemId : NSNumber?
    let packageType : String?
    let srNo : Int?
    
    
    enum CodingKeys: String, CodingKey {
        case barCode = "BarCode"
        case isDefault = "IsDefault"
        case isDeleted = "IsDeleted"
        case isUPCAutoGenerated = "IsUPCAutoGenerated"
        case itemId = "ItemId"
        case packageType = "PackageType"
        case srNo = "SrNo"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        barCode = try values.decodeIfPresent(String.self, forKey: .barCode)
        isDefault = try values.decodeIfPresent(Bool.self, forKey: .isDefault)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        isUPCAutoGenerated = try values.decodeIfPresent(Bool.self, forKey: .isUPCAutoGenerated)
        itemId = NSNumber(value: try (values.decodeIfPresent(Int.self, forKey: .itemId) ?? 0))
        packageType = try values.decodeIfPresent(String.self, forKey: .packageType)
        srNo = try values.decodeIfPresent(Int.self, forKey: .srNo)
    }
    func updateItemBarcodeDB(_ itemBarCode:ItemBarCode_Md){
        itemBarCode.barCode = barCode
        itemBarCode.isDefault = NSNumber(value: isDefault!)
        itemBarCode.isBarcodeDeleted = NSNumber(value: isDeleted!)
        itemBarCode.isAutoGenerated = NSNumber(value: isUPCAutoGenerated!)
        itemBarCode.itemCode = itemId
        itemBarCode.packageType = packageType
        itemBarCode.srNo = NSNumber(value: srNo!)
    }
    func linkItemBarcodeDBToItem(_ itemBarCode:ItemBarCode_Md, withItem item:Item) {
        item.addToItemBarcodes(itemBarCode)
        itemBarCode.barcodeItem = item
    }
}
// phose 2
public class ItemDiscountMDArray : NSObject, Decodable{

    var dISQty : Int!
    var dISUnitPrice : Float!
    var iDisNo : Int!
    @objc var iTEMCode : NSNumber!
    var isDeleted : Bool!
    var isDiscounted : Bool!
    
    enum CodingKeys: String, CodingKey {
        case dISQty = "DIS_Qty"
        case dISUnitPrice = "DIS_UnitPrice"
        case iDisNo = "IDisNo"
        case iTEMCode = "ITEMCode"
        case isDeleted = "IsDeleted"
        case isDiscounted = "IsDiscounted"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dISQty = try values.decodeIfPresent(Int.self, forKey: .dISQty)
        dISUnitPrice = try values.decodeIfPresent(Float.self, forKey: .dISUnitPrice)
        iDisNo = try values.decodeIfPresent(Int.self, forKey: .iDisNo)
        iTEMCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .iTEMCode)!)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        isDiscounted = try values.decodeIfPresent(Bool.self, forKey: .isDiscounted)
    }
    
    func updateItemDiscountDB(_ itemDiscount:Item_Discount_MD){
        itemDiscount.dis_Qty = NSNumber(value: dISQty!)
        itemDiscount.dis_UnitPrice = NSNumber(value: dISUnitPrice!)
        itemDiscount.iDisNo = NSNumber(value: iDisNo!)
        itemDiscount.itemCode = iTEMCode!
        itemDiscount.isDiscounted = NSNumber(value: isDiscounted!)
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if dISQty != nil{
            dictionary["DIS_Qty"] = dISQty
        }
        if dISUnitPrice != nil{
            dictionary["DIS_UnitPrice"] = dISUnitPrice
        }
        if iDisNo != nil{
            dictionary["IDisNo"] = iDisNo
        }
        if iTEMCode != nil{
            dictionary["ITEMCode"] = iTEMCode
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if isDiscounted != nil{
            dictionary["IsDiscounted"] = isDiscounted
        }
        return dictionary
    }
}
public class ItemDiscountMD2Array : NSObject, Decodable{
    var dayId : Int!
    @objc var discountId : NSNumber!
    var endDate : String!
    @objc var iTEMCode : NSNumber!
    var isDeleted : Bool!
    var rowId : Int!
    var startDate : String!
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if dayId != nil{
            dictionary["DayId"] = dayId
        }
        if discountId != nil{
            dictionary["DiscountId"] = discountId
        }
        if endDate != nil{
            dictionary["EndDate"] = endDate
        }
        if iTEMCode != nil{
            dictionary["ITEMCode"] = iTEMCode
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if rowId != nil{
            dictionary["RowId"] = rowId
        }
        if startDate != nil{
            dictionary["StartDate"] = startDate
        }
        return dictionary
    }
    enum CodingKeys: String, CodingKey {
        case dayId = "DayId"
        case discountId = "DiscountId"
        case endDate = "EndDate"
        case iTEMCode = "ITEMCode"
        case isDeleted = "IsDeleted"
        case rowId = "RowId"
        case startDate = "StartDate"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dayId = try values.decodeIfPresent(Int.self, forKey: .dayId)
        discountId = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .discountId)!)
        endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
        iTEMCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .iTEMCode)!)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        rowId = try values.decodeIfPresent(Int.self, forKey: .rowId)
        startDate = try values.decodeIfPresent(String.self, forKey: .startDate)
    }
    func updateItemDiscount2DB(_ itemDiscount:Item_Discount_MD2){
        itemDiscount.dayId = NSNumber(value: dayId!)
        itemDiscount.discountId = discountId!
        itemDiscount.endDate = endDate
        itemDiscount.rowId = NSNumber(value: rowId!)
        itemDiscount.startDate = startDate
    }
}
public class ItemPriceArray : NSObject, Decodable{

    var applyPrice : String!
    var cost : Float!
    var isDeleted : Bool!
    var isPackCaseAllow : Bool!
    @objc var itemCode : NSNumber!
    var priceA : Float!
    var priceB : Float!
    var priceC : Float!
    var priceQtyType : String!
    var profit : Float!
    var qty : Float!
    var quantityLimitA : Int!
    var quantityLimitB : Int!
    var quantityLimitC : Int!
    var unitPrice : Float!
    var unitQty : Int!
    var unitType : String!

    enum CodingKeys: String, CodingKey {
        case applyPrice = "ApplyPrice"
        case cost = "Cost"
        case isDeleted = "IsDeleted"
        case isPackCaseAllow = "IsPackCaseAllow"
        case itemCode = "ItemCode"
        case priceA = "PriceA"
        case priceB = "PriceB"
        case priceC = "PriceC"
        case priceQtyType = "PriceQtyType"
        case profit = "Profit"
        case qty = "Qty"
        case quantityLimitA = "QuantityLimitA"
        case quantityLimitB = "QuantityLimitB"
        case quantityLimitC = "QuantityLimitC"
        case unitPrice = "UnitPrice"
        case unitQty = "UnitQty"
        case unitType = "UnitType"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        applyPrice = try values.decodeIfPresent(String.self, forKey: .applyPrice)
        cost = try values.decodeIfPresent(Float.self, forKey: .cost)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        isPackCaseAllow = try values.decodeIfPresent(Bool.self, forKey: .isPackCaseAllow)
        itemCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemCode)!)
        priceA = try values.decodeIfPresent(Float.self, forKey: .priceA)
        priceB = try values.decodeIfPresent(Float.self, forKey: .priceB)
        priceC = try values.decodeIfPresent(Float.self, forKey: .priceC)
        priceQtyType = try values.decodeIfPresent(String.self, forKey: .priceQtyType)
        profit = try values.decodeIfPresent(Float.self, forKey: .profit)
        qty = try values.decodeIfPresent(Float.self, forKey: .qty)
        quantityLimitA = try values.decodeIfPresent(Int.self, forKey: .quantityLimitA)
        quantityLimitB = try values.decodeIfPresent(Int.self, forKey: .quantityLimitB)
        quantityLimitC = try values.decodeIfPresent(Int.self, forKey: .quantityLimitC)
        unitPrice = try values.decodeIfPresent(Float.self, forKey: .unitPrice)
        unitQty = try values.decodeIfPresent(Int.self, forKey: .unitQty)
        unitType = try values.decodeIfPresent(String.self, forKey: .unitType)
    }
    
    func updateItemPriceDB(_ itemPrice:Item_Price_MD) {
        itemPrice.applyPrice = applyPrice
        itemPrice.cost = NSNumber(value: cost)
//        itemPrice.isDeleted = NSNumber(value: isDeleted)
        itemPrice.isPackCaseAllow = NSNumber(value: isPackCaseAllow)
        itemPrice.itemcode = itemCode
        itemPrice.priceA = NSNumber(value: priceA)
        itemPrice.priceB = NSNumber(value: priceB)
        itemPrice.priceC = NSNumber(value: priceC)
        itemPrice.priceqtytype = priceQtyType
        itemPrice.profit = NSNumber(value: profit)
        itemPrice.qty = NSNumber(value: qty)
        itemPrice.quantityLimitA = NSNumber(value: quantityLimitA)
        itemPrice.quantityLimitB = NSNumber(value: quantityLimitB)
        itemPrice.quantityLimitC = NSNumber(value: quantityLimitC)
        itemPrice.unitPrice = NSNumber(value: unitPrice)
        itemPrice.unitQty = NSNumber(value: unitQty)
        itemPrice.unitType = unitType
    }
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if applyPrice != nil{
            dictionary["ApplyPrice"] = applyPrice
        }
        if cost != nil{
            dictionary["Cost"] = cost
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if isPackCaseAllow != nil{
            dictionary["IsPackCaseAllow"] = isPackCaseAllow
        }
        if itemCode != nil{
            dictionary["ItemCode"] = itemCode
        }
        if priceA != nil{
            dictionary["PriceA"] = priceA
        }
        if priceB != nil{
            dictionary["PriceB"] = priceB
        }
        if priceC != nil{
            dictionary["PriceC"] = priceC
        }
        if priceQtyType != nil{
            dictionary["PriceQtyType"] = priceQtyType
        }
        if profit != nil{
            dictionary["Profit"] = profit
        }
        if qty != nil{
            dictionary["Qty"] = qty
        }
        if quantityLimitA != nil{
            dictionary["QuantityLimitA"] = quantityLimitA
        }
        if quantityLimitB != nil{
            dictionary["QuantityLimitB"] = quantityLimitB
        }
        if quantityLimitC != nil{
            dictionary["QuantityLimitC"] = quantityLimitC
        }
        if unitPrice != nil{
            dictionary["UnitPrice"] = unitPrice
        }
        if unitQty != nil{
            dictionary["UnitQty"] = unitQty
        }
        if unitType != nil{
            dictionary["UnitType"] = unitType
        }
        return dictionary
    }
}


/// phase 3 response

class VariationItemArray : NSObject, Decodable{
    
    var applyPrice : String!
    var cost : Float!
    var isDeleted : Bool!
    @objc var itemCode : NSNumber!
    var measurementQuantity : Float!
    var measurementUnit : String!
    var name : String!
    var priceA : Float!
    var priceB : Float!
    var priceC : Float!
    var profit : Float!
    var rowId : Int!
    var rowPosNo : Int!
    var unitPrice : Float!
    var varianceId : Int!
    

    enum CodingKeys: String, CodingKey {
        case applyPrice = "ApplyPrice"
        case cost = "Cost"
        case isDeleted = "IsDeleted"
        case itemCode = "ItemCode"
        case measurementQuantity = "MeasurementQuantity"
        case measurementUnit = "MeasurementUnit"
        case name = "Name"
        case priceA = "PriceA"
        case priceB = "PriceB"
        case priceC = "PriceC"
        case profit = "Profit"
        case rowId = "RowId"
        case rowPosNo = "RowPosNo"
        case unitPrice = "UnitPrice"
        case varianceId = "VarianceId"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        applyPrice = try values.decodeIfPresent(String.self, forKey: .applyPrice)
        cost = try values.decodeIfPresent(Float.self, forKey: .cost)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        itemCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemCode)!)
        measurementQuantity = try values.decodeIfPresent(Float.self, forKey: .measurementQuantity)
        measurementUnit = try values.decodeIfPresent(String.self, forKey: .measurementUnit)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        priceA = try values.decodeIfPresent(Float.self, forKey: .priceA)
        priceB = try values.decodeIfPresent(Float.self, forKey: .priceB)
        priceC = try values.decodeIfPresent(Float.self, forKey: .priceC)
        profit = try values.decodeIfPresent(Float.self, forKey: .profit)
        rowId = try values.decodeIfPresent(Int.self, forKey: .rowId)
        rowPosNo = try values.decodeIfPresent(Int.self, forKey: .rowPosNo)
        unitPrice = try values.decodeIfPresent(Float.self, forKey: .unitPrice)
        varianceId = try values.decodeIfPresent(Int.self, forKey: .varianceId)
    }
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if applyPrice != nil{
            dictionary["ApplyPrice"] = applyPrice
        }
        if cost != nil{
            dictionary["Cost"] = cost
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if itemCode != nil{
            dictionary["ItemCode"] = itemCode
        }
        if measurementQuantity != nil{
            dictionary["MeasurementQuantity"] = measurementQuantity
        }
        if measurementUnit != nil{
            dictionary["MeasurementUnit"] = measurementUnit
        }
        if name != nil{
            dictionary["Name"] = name
        }
        if priceA != nil{
            dictionary["PriceA"] = priceA
        }
        if priceB != nil{
            dictionary["PriceB"] = priceB
        }
        if priceC != nil{
            dictionary["PriceC"] = priceC
        }
        if profit != nil{
            dictionary["Profit"] = profit
        }
        if rowId != nil{
            dictionary["RowId"] = rowId
        }
        if rowPosNo != nil{
            dictionary["RowPosNo"] = rowPosNo
        }
        if unitPrice != nil{
            dictionary["UnitPrice"] = unitPrice
        }
        if varianceId != nil{
            dictionary["VarianceId"] = varianceId
        }
        return dictionary
    }
    func updateItemVariationMDDB(_ variationMD:ItemVariation_Md){
        
        variationMD.applyPrice = applyPrice
        variationMD.cost = NSNumber(value:cost)
        variationMD.itemCode = itemCode
        variationMD.isDelete = NSNumber(value:isDeleted)
        variationMD.measurementQuantity = NSNumber(value:measurementQuantity)
        variationMD.measurementUnit = measurementUnit
        variationMD.name = name
        variationMD.priceA = NSNumber(value:priceA)
        variationMD.priceB = NSNumber(value:priceB)
        variationMD.priceC = NSNumber(value:priceC)
        variationMD.profit = NSNumber(value:profit)
        variationMD.rowPosNo = NSNumber(value:rowId)
        variationMD.rowPosNo = NSNumber(value:rowPosNo)
        variationMD.unitPrice = NSNumber(value:unitPrice)
        variationMD.varianceId = NSNumber(value:varianceId)
    }
}
class VariationArray : NSObject, Decodable{
    
    var colPosNo : Int!
    var id : Int!
    var isDeleted : Bool!
    @objc var itemCode : NSNumber!
    var variationId : Int!
    
    
    enum CodingKeys: String, CodingKey {
        case colPosNo = "ColPosNo"
        case id = "Id"
        case isDeleted = "IsDeleted"
        case itemCode = "ItemCode"
        case variationId = "VariationId"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        colPosNo = try values.decodeIfPresent(Int.self, forKey: .colPosNo)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        itemCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemCode)!)
        variationId = try values.decodeIfPresent(Int.self, forKey: .variationId)
    }
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if colPosNo != nil{
            dictionary["ColPosNo"] = colPosNo
        }
        if id != nil{
            dictionary["Id"] = id
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if itemCode != nil{
            dictionary["ItemCode"] = itemCode
        }
        if variationId != nil{
            dictionary["VariationId"] = variationId
        }
        return dictionary
    }
    func updateItemVariationDB(_ itemVariation:ItemVariation_M){
        itemVariation.colPosNo = NSNumber(value: colPosNo)
        itemVariation.varianceId = NSNumber(value: id)
        itemVariation.itemCode = itemCode
        itemVariation.variationMasterId = NSNumber(value: variationId)
    }
}

class ItemSupplierArray : NSObject, Decodable {

    @objc var iTEMCODE : NSNumber!
    var isDeleted : Bool!
    var sUPId : Int!
    var vendorId : Int!


    enum CodingKeys: String, CodingKey {
        case iTEMCODE = "ITEMCODE"
        case isDeleted = "IsDeleted"
        case sUPId = "SUPId"
        case vendorId = "VendorId"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iTEMCODE = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .iTEMCODE)!)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        sUPId = try values.decodeIfPresent(Int.self, forKey: .sUPId)
        vendorId = try values.decodeIfPresent(Int.self, forKey: .vendorId)
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if iTEMCODE != nil{
            dictionary["ITEMCODE"] = iTEMCODE
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if sUPId != nil{
            dictionary["SUPId"] = sUPId
        }
        if vendorId != nil{
            dictionary["VendorId"] = vendorId
        }
        return dictionary
    }
    func updateItemSupplierDB(_ itemSupplier:ItemSupplier){
        itemSupplier.supId = NSNumber(value: sUPId)
        itemSupplier.itemCode = iTEMCODE
        itemSupplier.vendorId = NSNumber(value: vendorId)
    }
}

class ItemTicketArray : NSObject, Decodable{
    
    var createddate : String!
    var dateCreated : String!
    var expirationDays : Int!
    var friday : Bool!
    var id : Int!
    var isDeleted : Bool!
    var isExpiration : Bool!
    @objc var itemCode : NSNumber!
    var monday : Bool!
    var noOfPerson : Int!
    var noOfdays : Int!
    var saturday : Bool!
    var selectedOption : Int!
    var sunday : Bool!
    var thursday : Bool!
    var tuesday : Bool!
    var userId : Int!
    var wednesday : Bool!
    
    enum CodingKeys: String, CodingKey {
        case createddate = "Createddate"
        case dateCreated = "DateCreated"
        case expirationDays = "ExpirationDays"
        case friday = "Friday"
        case id = "Id"
        case isDeleted = "IsDeleted"
        case isExpiration = "IsExpiration"
        case itemCode = "ItemCode"
        case monday = "Monday"
        case noOfPerson = "NoOfPerson"
        case noOfdays = "NoOfdays"
        case saturday = "Saturday"
        case selectedOption = "SelectedOption"
        case sunday = "Sunday"
        case thursday = "Thursday"
        case tuesday = "Tuesday"
        case userId = "UserId"
        case wednesday = "Wednesday"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        #warning("TODO: Set to date object")
        createddate = try values.decodeIfPresent(String.self, forKey: .createddate)
        dateCreated = try values.decodeIfPresent(String.self, forKey: .dateCreated)
        expirationDays = try values.decodeIfPresent(Int.self, forKey: .expirationDays)
        friday = try values.decodeIfPresent(Bool.self, forKey: .friday)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        isExpiration = try values.decodeIfPresent(Bool.self, forKey: .isExpiration)
        itemCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemCode)!)
        monday = try values.decodeIfPresent(Bool.self, forKey: .monday)
        noOfPerson = try values.decodeIfPresent(Int.self, forKey: .noOfPerson)
        noOfdays = try values.decodeIfPresent(Int.self, forKey: .noOfdays)
        saturday = try values.decodeIfPresent(Bool.self, forKey: .saturday)
        selectedOption = try values.decodeIfPresent(Int.self, forKey: .selectedOption)
        sunday = try values.decodeIfPresent(Bool.self, forKey: .sunday)
        thursday = try values.decodeIfPresent(Bool.self, forKey: .thursday)
        tuesday = try values.decodeIfPresent(Bool.self, forKey: .tuesday)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        wednesday = try values.decodeIfPresent(Bool.self, forKey: .wednesday)
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if createddate != nil{
            dictionary["Createddate"] = createddate
        }
        if dateCreated != nil{
            dictionary["DateCreated"] = dateCreated
        }
        if expirationDays != nil{
            dictionary["ExpirationDays"] = expirationDays
        }
        if friday != nil{
            dictionary["Friday"] = friday
        }
        if id != nil{
            dictionary["Id"] = id
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if isExpiration != nil{
            dictionary["IsExpiration"] = isExpiration
        }
        if itemCode != nil{
            dictionary["ItemCode"] = itemCode
        }
        if monday != nil{
            dictionary["Monday"] = monday
        }
        if noOfPerson != nil{
            dictionary["NoOfPerson"] = noOfPerson
        }
        if noOfdays != nil{
            dictionary["NoOfdays"] = noOfdays
        }
        if saturday != nil{
            dictionary["Saturday"] = saturday
        }
        if selectedOption != nil{
            dictionary["SelectedOption"] = selectedOption
        }
        if sunday != nil{
            dictionary["Sunday"] = sunday
        }
        if thursday != nil{
            dictionary["Thursday"] = thursday
        }
        if tuesday != nil{
            dictionary["Tuesday"] = tuesday
        }
        if userId != nil{
            dictionary["UserId"] = userId
        }
        if wednesday != nil{
            dictionary["Wednesday"] = wednesday
        }
        return dictionary
    }
    func updateItemTicketDB(_ itemTicket:ItemTicket_MD) {
        #warning("TODO: Set to date object")
//        itemTicket.createddate = createddate
//        itemTicket.dateCreated = dateCreated
        itemTicket.expirationDays = NSNumber(value: expirationDays)
        itemTicket.friday = NSNumber(value: friday)
        itemTicket.ticketId = NSNumber(value: id)
//        itemTicket.isDele = NSNumber(value: isDeleted)
        itemTicket.isExpiration = NSNumber(value: isExpiration)
        itemTicket.itemCode = itemCode
        itemTicket.monday = NSNumber(value: monday)
        itemTicket.noOfPerson = NSNumber(value: noOfPerson)
        itemTicket.noOfdays = NSNumber(value: noOfdays)
        itemTicket.saturday = NSNumber(value: saturday)
        itemTicket.selectedOption = NSNumber(value: selectedOption)
        itemTicket.sunday = NSNumber(value: sunday)
        itemTicket.thursday = NSNumber(value: thursday)
        itemTicket.tuesday = NSNumber(value: tuesday)
        itemTicket.userId = NSNumber(value: userId)
        itemTicket.wednesday = NSNumber(value: wednesday)
    }
}
class ItemSizeArray : NSObject, Decodable{
    
    var isDeleted : Bool!
    @objc var itemId : NSNumber!
    var sizeId : Int!


    enum CodingKeys: String, CodingKey {
        case isDeleted = "IsDeleted"
        case itemId = "ItemId"
        case sizeId = "SizeId"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        itemId = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemId)!)
        sizeId = try values.decodeIfPresent(Int.self, forKey: .sizeId)
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if itemId != nil{
            dictionary["ItemId"] = itemId
        }
        if sizeId != nil{
            dictionary["SizeId"] = sizeId
        }
        return dictionary
    }
    func updateItemTagDB(_ itemTag:ItemTag){
        itemTag.itemId = itemId
        itemTag.sizeId = NSNumber(value: sizeId)
        itemTag.isDelete = NSNumber(value: isDeleted)
    }
}
class ITMTAXMDArray : NSObject, Decodable{
    
    var amount : Float!
    @objc var iTEMCode : NSNumber!
    var isDeleted : Bool!
    var tAXId : Int!

    enum CodingKeys: String, CodingKey {
        case amount = "Amount"
        case iTEMCode = "ITEMCode"
        case isDeleted = "IsDeleted"
        case tAXId = "TAXId"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amount = try values.decodeIfPresent(Float.self, forKey: .amount)
        iTEMCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .iTEMCode)!)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        tAXId = try values.decodeIfPresent(Int.self, forKey: .tAXId)
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if amount != nil{
            dictionary["Amount"] = amount
        }
        if iTEMCode != nil{
            dictionary["ITEMCode"] = iTEMCode
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if tAXId != nil{
            dictionary["TAXId"] = tAXId
        }
        return dictionary
    }
    func updateItemTaxDB(_ itemTax:ItemTax) {
        itemTax.amount = NSNumber(value: amount)
        itemTax.itemId = iTEMCode
        itemTax.taxId = NSNumber(value: tAXId)
    }
}

class DiscountPrimaryArray : NSObject, Decodable{
    
    var createdDate : String!
    var dateCreated : String!
    var discountId : Int!
    var id : Int!
    var isDelete : Bool!
    var isDeleted : Bool!
    @objc var itemCode : NSNumber!
    var itemType : Int!


    enum CodingKeys: String, CodingKey {
        case createdDate = "CreatedDate"
        case dateCreated = "DateCreated"
        case discountId = "DiscountId"
        case id = "Id"
        case isDelete = "IsDelete"
        case isDeleted = "IsDeleted"
        case itemCode = "ItemCode"
        case itemType = "ItemType"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        dateCreated = try values.decodeIfPresent(String.self, forKey: .dateCreated)
        discountId = try values.decodeIfPresent(Int.self, forKey: .discountId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        isDelete = try values.decodeIfPresent(Bool.self, forKey: .isDelete)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        itemCode = NSNumber(value: try values.decodeIfPresent(Int.self, forKey: .itemCode)!)
        itemType = try values.decodeIfPresent(Int.self, forKey: .itemType)
    }
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdDate != nil{
            dictionary["CreatedDate"] = createdDate
        }
        if dateCreated != nil{
            dictionary["DateCreated"] = dateCreated
        }
        if discountId != nil{
            dictionary["DiscountId"] = discountId
        }
        if id != nil{
            dictionary["Id"] = id
        }
        if isDelete != nil{
            dictionary["IsDelete"] = isDelete
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if itemCode != nil{
            dictionary["ItemCode"] = itemCode
        }
        if itemType != nil{
            dictionary["ItemType"] = itemType
        }
        return dictionary
    }
    func updateDiscountPrimaryItemDB(_ primaryItem:Discount_Primary_MD) {
        
//        primaryItem.createdDate = NSNumber(value : createdDate)

        primaryItem.discountId = NSNumber(value : discountId)
        primaryItem.primaryId = NSNumber(value : id)
        primaryItem.isDelete = NSNumber(value : isDelete)
        primaryItem.itemId = itemCode
        primaryItem.itemType = NSNumber(value : itemType)
    }
    func updateDiscountSecondaryItemDB(_ secondaryItem:Discount_Secondary_MD) {
//        secondaryItem.createdDate = NSNumber(value : createdDate)

        secondaryItem.discountId = NSNumber(value : discountId)
        secondaryItem.secondaryId = NSNumber(value : id)
        secondaryItem.isDelete = NSNumber(value : isDelete)
        secondaryItem.itemId = itemCode
        secondaryItem.itemType = NSNumber(value : itemType)
    }
}
class DiscountMasterArray : NSObject, Decodable{
    
    var branchId : Int!
    var code : String!
    var couponId : Int!
    var createdBy : Int!
    var createdDate : String!
    var descriptionField : String!
    var discountBy : Int!
    var discountId : Int!
    var discountType : Int!
    var endDate : String!
    var endTime : String!
    var free : Float!
    var freeType : Int!
    var fuelValueForPI : Float!
    var fuelValueForSI : Float!
    var isApplyManually : Bool!
    var isCustomerSelectionRequired : Bool!
    var isDelete : Bool!
    var isDeleted : Bool!
    var localDateTime : String!
    var name : String!
    var primaryItemQty : Int!
    var qtyLimit : Int!
    var qualificationCriteriaForPI : Int!
    var qualificationCriteriaForSI : Int!
    var quantityType : Int!
    var secondaryItemQty : Int!
    var spentAmount : Float!
    var start : String!
    var startTime : String!
    var taxType : Int!
    var validDays : Int!
    var isCase : Bool!
    var isOnLowestPrice : Bool!
    var isPack : Bool!
    var isStatus : Bool!
    var isUnit : Bool!


    enum CodingKeys: String, CodingKey {
        case branchId = "BranchId"
        case code = "Code"
        case couponId = "CouponId"
        case createdBy = "CreatedBy"
        case createdDate = "CreatedDate"
        case descriptionField = "Description"
        case discountBy = "DiscountBy"
        case discountId = "DiscountId"
        case discountType = "DiscountType"
        case endDate = "EndDate"
        case endTime = "EndTime"
        case free = "Free"
        case freeType = "FreeType"
        case fuelValueForPI = "FuelValueForPI"
        case fuelValueForSI = "FuelValueForSI"
        case isApplyManually = "IsApplyManually"
        case isCustomerSelectionRequired = "IsCustomerSelectionRequired"
        case isDelete = "IsDelete"
        case isDeleted = "IsDeleted"
        case localDateTime = "LocalDateTime"
        case name = "Name"
        case primaryItemQty = "PrimaryItemQty"
        case qtyLimit = "QtyLimit"
        case qualificationCriteriaForPI = "QualificationCriteriaForPI"
        case qualificationCriteriaForSI = "QualificationCriteriaForSI"
        case quantityType = "QuantityType"
        case secondaryItemQty = "SecondaryItemQty"
        case spentAmount = "SpentAmount"
        case start = "Start"
        case startTime = "StartTime"
        case taxType = "TaxType"
        case validDays = "ValidDays"
        case isCase = "isCase"
        case isOnLowestPrice = "isOnLowestPrice"
        case isPack = "isPack"
        case isStatus = "isStatus"
        case isUnit = "isUnit"
    }
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        branchId = try values.decodeIfPresent(Int.self, forKey: .branchId)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        couponId = try values.decodeIfPresent(Int.self, forKey: .couponId)
        createdBy = try values.decodeIfPresent(Int.self, forKey: .createdBy)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
        descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
        discountBy = try values.decodeIfPresent(Int.self, forKey: .discountBy)
        discountId = try values.decodeIfPresent(Int.self, forKey: .discountId)
        discountType = try values.decodeIfPresent(Int.self, forKey: .discountType)
        endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
        endTime = try values.decodeIfPresent(String.self, forKey: .endTime)
        free = try values.decodeIfPresent(Float.self, forKey: .free)
        freeType = try values.decodeIfPresent(Int.self, forKey: .freeType)
        fuelValueForPI = try values.decodeIfPresent(Float.self, forKey: .fuelValueForPI)
        fuelValueForSI = try values.decodeIfPresent(Float.self, forKey: .fuelValueForSI)
        isApplyManually = try values.decodeIfPresent(Bool.self, forKey: .isApplyManually)
        isCustomerSelectionRequired = try values.decodeIfPresent(Bool.self, forKey: .isCustomerSelectionRequired)
        isDelete = try values.decodeIfPresent(Bool.self, forKey: .isDelete)
        isDeleted = try values.decodeIfPresent(Bool.self, forKey: .isDeleted)
        localDateTime = try values.decodeIfPresent(String.self, forKey: .localDateTime)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        primaryItemQty = try values.decodeIfPresent(Int.self, forKey: .primaryItemQty)
        qtyLimit = try values.decodeIfPresent(Int.self, forKey: .qtyLimit)
        qualificationCriteriaForPI = try values.decodeIfPresent(Int.self, forKey: .qualificationCriteriaForPI)
        qualificationCriteriaForSI = try values.decodeIfPresent(Int.self, forKey: .qualificationCriteriaForSI)
        quantityType = try values.decodeIfPresent(Int.self, forKey: .quantityType)
        secondaryItemQty = try values.decodeIfPresent(Int.self, forKey: .secondaryItemQty)
        spentAmount = try values.decodeIfPresent(Float.self, forKey: .spentAmount)
        start = try values.decodeIfPresent(String.self, forKey: .start)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        taxType = try values.decodeIfPresent(Int.self, forKey: .taxType)
        validDays = try values.decodeIfPresent(Int.self, forKey: .validDays)
        isCase = try values.decodeIfPresent(Bool.self, forKey: .isCase)
        isOnLowestPrice = try values.decodeIfPresent(Bool.self, forKey: .isOnLowestPrice)
        isPack = try values.decodeIfPresent(Bool.self, forKey: .isPack)
        isStatus = try values.decodeIfPresent(Bool.self, forKey: .isStatus)
        isUnit = try values.decodeIfPresent(Bool.self, forKey: .isUnit)
    }
    func toDictionary() -> [String:Any] {
        var dictionary = [String:Any]()
        if branchId != nil{
            dictionary["BranchId"] = branchId
        }
        if code != nil{
            dictionary["Code"] = code
        }
        if couponId != nil{
            dictionary["CouponId"] = couponId
        }
        if createdBy != nil{
            dictionary["CreatedBy"] = createdBy
        }
        if createdDate != nil{
            dictionary["CreatedDate"] = createdDate
        }
        if descriptionField != nil{
            dictionary["Description"] = descriptionField
        }
        if discountBy != nil{
            dictionary["DiscountBy"] = discountBy
        }
        if discountId != nil{
            dictionary["DiscountId"] = discountId
        }
        if discountType != nil{
            dictionary["DiscountType"] = discountType
        }
        if endDate != nil{
            dictionary["EndDate"] = endDate
        }
        if endTime != nil{
            dictionary["EndTime"] = endTime
        }
        if free != nil{
            dictionary["Free"] = free
        }
        if freeType != nil{
            dictionary["FreeType"] = freeType
        }
        if fuelValueForPI != nil{
            dictionary["FuelValueForPI"] = fuelValueForPI
        }
        if fuelValueForSI != nil{
            dictionary["FuelValueForSI"] = fuelValueForSI
        }
        if isApplyManually != nil{
            dictionary["IsApplyManually"] = isApplyManually
        }
        if isCustomerSelectionRequired != nil{
            dictionary["IsCustomerSelectionRequired"] = isCustomerSelectionRequired
        }
        if isDelete != nil{
            dictionary["IsDelete"] = isDelete
        }
        if isDeleted != nil{
            dictionary["IsDeleted"] = isDeleted
        }
        if localDateTime != nil{
            dictionary["LocalDateTime"] = localDateTime
        }
        if name != nil{
            dictionary["Name"] = name
        }
        if primaryItemQty != nil{
            dictionary["PrimaryItemQty"] = primaryItemQty
        }
        if qtyLimit != nil{
            dictionary["QtyLimit"] = qtyLimit
        }
        if qualificationCriteriaForPI != nil{
            dictionary["QualificationCriteriaForPI"] = qualificationCriteriaForPI
        }
        if qualificationCriteriaForSI != nil{
            dictionary["QualificationCriteriaForSI"] = qualificationCriteriaForSI
        }
        if quantityType != nil{
            dictionary["QuantityType"] = quantityType
        }
        if secondaryItemQty != nil{
            dictionary["SecondaryItemQty"] = secondaryItemQty
        }
        if spentAmount != nil{
            dictionary["SpentAmount"] = spentAmount
        }
        if start != nil{
            dictionary["Start"] = start
        }
        if startTime != nil{
            dictionary["StartTime"] = startTime
        }
        if taxType != nil{
            dictionary["TaxType"] = taxType
        }
        if validDays != nil{
            dictionary["ValidDays"] = validDays
        }
        if isCase != nil{
            dictionary["isCase"] = isCase
        }
        if isOnLowestPrice != nil{
            dictionary["isOnLowestPrice"] = isOnLowestPrice
        }
        if isPack != nil{
            dictionary["isPack"] = isPack
        }
        if isStatus != nil{
            dictionary["isStatus"] = isStatus
        }
        if isUnit != nil{
            dictionary["isUnit"] = isUnit
        }
        return dictionary
    }
    func updateItemDiscountDB(_ itemDiscount:Discount_M) {
        
        
//        itemDiscount.branchId = NSNumber(value : branchId)
        itemDiscount.code = code
//        itemDiscount.couponId = NSNumber(value : couponId)
//        itemDiscount.createdBy = NSNumber(value : createdBy)
        #warning("TODO: Set to date object")
//        itemDiscount.createdDate = NSNumber(value : localDateTime)
//        itemDiscount.endDate = NSNumber(value : endDate)
//        itemDiscount.endTime = NSNumber(value : endTime)
//        itemDiscount.start = NSNumber(value : start)
//        itemDiscount.startTime = NSNumber(value : startTime)
        
        itemDiscount.descriptionText = descriptionField
//        itemDiscount.discountBy = NSNumber(value : discountBy)
        itemDiscount.discountId = NSNumber(value : discountId)
        itemDiscount.discountType = NSNumber(value : discountType)
        itemDiscount.free = NSNumber(value : free)
        itemDiscount.freeType = NSNumber(value : freeType)
        itemDiscount.fuelValueForPI = NSNumber(value : fuelValueForPI)
        itemDiscount.fuelValueForSI = NSNumber(value : fuelValueForSI)
        itemDiscount.isApplyManually = NSNumber(value : isApplyManually)
        itemDiscount.isCustomerSelectionRequired = NSNumber(value : isCustomerSelectionRequired)
        itemDiscount.isDelete = NSNumber(value : isDelete)

        itemDiscount.name = name
        itemDiscount.primaryItemQty = NSNumber(value : primaryItemQty)
        itemDiscount.qtyLimit = NSNumber(value : qtyLimit)
        itemDiscount.qualificationCriteriaForPI = NSNumber(value : qualificationCriteriaForPI)
        itemDiscount.qualificationCriteriaForSI = NSNumber(value : qualificationCriteriaForSI)
        itemDiscount.quantityType = NSNumber(value : quantityType)
        itemDiscount.secondaryItemQty = NSNumber(value : secondaryItemQty)
//        itemDiscount.spentAmount = NSNumber(value : spentAmount)
        
        itemDiscount.taxType = NSNumber(value : taxType)
        itemDiscount.validDays = NSNumber(value : validDays)
        itemDiscount.isCase = NSNumber(value : isCase)
        itemDiscount.isOnLowestPrice = NSNumber(value : isOnLowestPrice)
        itemDiscount.isPack = NSNumber(value : isPack)
        itemDiscount.isStatus = NSNumber(value : isStatus)
        itemDiscount.isUnit = NSNumber(value : isUnit)
        
        
    }
}
