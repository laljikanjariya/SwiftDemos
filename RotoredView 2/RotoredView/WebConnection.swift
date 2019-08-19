//
//  WebConnection.swift
//  RotoredView
//
//  Created by Siya9 on 16/03/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit
typealias CompletionBlock = (Data?, URLResponse?, Error?) -> Void

class WebConnection: NSObject {
    class func loadPostRequest(_ urlString: String, param:NSDictionary?, responce:@escaping CompletionBlock){
        
        let request = NSMutableURLRequest(url: NSURL(string: urlString)! as URL)
        request.httpMethod = "POST"
        var bodyData:NSData?
        if param != nil {
            do {
                bodyData = try JSONSerialization.data(withJSONObject: param!, options:[]) as NSData?
            }catch {
                print("i dunno")
            }
        }
        
        request.httpBody = bodyData as Data?
        request.addValue("applicatn/json", forHTTPHeaderField: "Content-Type")
        request.addValue("\(bodyData?.length)", forHTTPHeaderField: "Content-Length")
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            responce(data, response, error)
        }).resume()
    }
}
