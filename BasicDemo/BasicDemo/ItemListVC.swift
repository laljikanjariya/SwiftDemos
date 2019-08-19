//
//  ItemListVC.swift
//  BasicDemo
//
//  Created by Siya9 on 24/11/16.
//  Copyright © 2016 Siya9. All rights reserved.
//

import UIKit

class ItemInfo {
    var name : String
    var price : NSNumber
    init(name : String, price : NSNumber)  {
        self.name = name
        self.price = price
    }
}

class ItemListCell1: UITableViewCell {
    @IBOutlet var name : UILabel?
    @IBOutlet var price : UILabel?
    func initWith(itemInfo : ItemInfo)  {
        self.name?.text = itemInfo.name
        self.price?.text = itemInfo.price.stringValue
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

class ItemListVC: UIViewController {
    @IBOutlet weak var tblItemList : UITableView!
    
    var arrList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrList.add(ItemInfo(name: "Milan",price: (10.5)))
        arrList.add(ItemInfo(name: "Hitu",price: (9.5)))
        arrList.add(ItemInfo(name: "Hiro",price: (8.5)))
        arrList.add(ItemInfo(name: "Rajni",price: (7.5)))
        arrList.add(ItemInfo(name: "Lalji",price: (6.5)))
        arrList.add(ItemInfo(name: "Harsh",price: (4.5)))
        arrList.add(ItemInfo(name: "Sonali",price: (25)))
        arrList.add(ItemInfo(name: "Vishal",price: (05)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell{
        let cell : ItemListCell1 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemListCell1
        let itemInfo : ItemInfo = arrList.object(at: indexPath.row) as! ItemInfo
        cell.initWith(itemInfo: itemInfo)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
