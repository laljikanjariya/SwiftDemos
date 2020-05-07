//
//  LKRRMSNetworkManager.swift
//  LKRapidRMS-WC_SLib
//
//  Created by Lalji on 27/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
public typealias CompletionBlock = (_ data: Data?,_ response:URLResponse?, _ error: Error?) -> Void
open class LKRRMSNetworkManager: NSObject {
    var sesion : URLSession
    public override init() {
        sesion = URLSession.init(configuration: URLSessionConfiguration.default)
    }
    public func initRequest(stringURL strURL:String, Request params:NSDictionary?, Response completionBlock:@escaping CompletionBlock) {
        let url = URL.init(string: strURL)!
        let request = createRequest(StringURL: url, params: params)
        sesion.dataTask(with:request , completionHandler: { (data, response, error) in
            completionBlock(data, response, error)
            }).resume()
    }
    public func initRequest(stringAction action:String, Request params:NSDictionary?, Response completionBlock:@escaping CompletionBlock) {
        let url = URL.init(string: (LKRRMSConstants.shared.APIMainURL! as NSString).appendingPathComponent(action))!
        sesion.dataTask(with: createRequest(StringURL: url, params: params), completionHandler: { (data, response, error) in
            completionBlock(data, response, error)
            }).resume()
    }
    private func createRequest(StringURL url:URL, params:NSDictionary?) -> URLRequest {
        var request:NSMutableURLRequest = NSMutableURLRequest.init(url: url)
        request = createHeaderParamRequest(Request: request)
        if let reqData = params {
            request = createParamRequest(Request: request, params: reqData)
        }
        return request as URLRequest;
    }
    private func createHeaderParamRequest(Request request:NSMutableURLRequest) -> NSMutableURLRequest {
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let dbName = LKRRMSConstants.shared.DatabaseName{
            request.setValue(dbName, forHTTPHeaderField: "DBName-Header")
        }
        return request;
    }
    private func createParamRequest(Request request:NSMutableURLRequest, params:NSDictionary?) -> NSMutableURLRequest {
        var data:Data?
        do{
            data = try JSONSerialization.data(withJSONObject: params!, options:.prettyPrinted)
        }
        catch let error {
            print(error.localizedDescription)
        }
        request.setValue(String(data!.count), forHTTPHeaderField: "Content-Length")
        request.httpBody = data!
        return request;
    }
}
