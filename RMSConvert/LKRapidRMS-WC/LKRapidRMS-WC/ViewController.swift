//
//  ViewController.swift
//  LKRapidRMS-WC
//
//  Created by Lalji on 23/08/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
class ImgeLisrData : NSObject & Codable{
    @objc let albumId : Int
    @objc var id : Int
    @objc var title : String?
    @objc var url : URL?
    @objc let thumbnailUrl : URL?
    
    override open var description: String {
        return "albumId = \(String(describing: albumId)) \n title = \(String(describing: title)) \n url = \(String(describing: url)) \n thumbnailUrl = \(String(describing: thumbnailUrl))"
    }
}
class ViewController: UIViewController {
    var imageList:[ImgeLisrData]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        LKRRMSConstants.shared.APIMainURL = ""
        LKRRMSNetworkManager().initRequest(stringURL: "https://jsonplaceholder.typicode.com/photos", Request: nil) { (data,response, error) in
            self.imageList = try? JSONDecoder().decode([ImgeLisrData].self, from: data!)
                    print(self.imageList?.count as Any)
                    print(self.imageList?.first?.description ?? "Null value")
                    self.filterObject()
        //            if let jsonModelDecode1 = try? JSONDecoder().decode(ImgeLisrData.self, from: data) {
        //                print("Page Detail", jsonModelDecode1.page as Any)
        //                print("User Detail", jsonModelDecode1.total_pages as Any)
        //                for element in jsonModelDecode1.userListData! {
        //                    print(element.firstName)
        //                }
        //
        //                let jsonModelDecodestring = try JSONEncoder().encode(jsonModelDecode1)
        //                print("============================================")
        //                print(NSString.init(data: jsonModelDecodestring, encoding: String.Encoding.utf8.rawValue)! )
        //                print("============================================")
        //            }
                }
//        LKRRMSNetworkManager
//        _ = LKRapidRMSWebCon.init(requestActionName: "photos", params: nil, completionHandler: { (data, error) in
//            self.imageList = try? JSONDecoder().decode([ImgeLisrData].self, from: data as! Data)
//            print(self.imageList?.count as Any)
//            print(self.imageList?.first?.description ?? "Null value")
//            self.filterObject()
////            if let jsonModelDecode1 = try? JSONDecoder().decode(ImgeLisrData.self, from: data) {
////                print("Page Detail", jsonModelDecode1.page as Any)
////                print("User Detail", jsonModelDecode1.total_pages as Any)
////                for element in jsonModelDecode1.userListData! {
////                    print(element.firstName)
////                }
////
////                let jsonModelDecodestring = try JSONEncoder().encode(jsonModelDecode1)
////                print("============================================")
////                print(NSString.init(data: jsonModelDecodestring, encoding: String.Encoding.utf8.rawValue)! )
////                print("============================================")
////            }
//        })
    }
    func filterObject(){
        print("before")
        print(self.imageList?.first?.description ?? "Null value")
        let updateImage = filterImage(withImageId: 1)
        updateImage?.title = "Kanjariya"
        print("after")
        print(self.imageList?.first?.description ?? "Null value")
    }
    func filterImage(withImageId id:Int) -> ImgeLisrData? {

//        return imageList?.filter({ $0.title!.contains("accusamus beatae ad facilis cum similique qui sunt")}).first
        return imageList?.filter({
            let predicate = NSPredicate(format: "title CONTAINS[cd] %@ OR id = %@", "accusamus beatae ad facilis cum similique qui sunt")

            return predicate.evaluate(with: $0)}
        ).first
    }
}

