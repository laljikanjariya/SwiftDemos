//
//  LKRapidRMSConstants.swift
//  LKRapidRMS-WC
//
//  Created by Lalji on 23/08/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit

open class LKRRMSConstants: NSObject {
    open var DatabaseName:String?
    
    open var APIMainURL:String?
    
    open var requestTimeOut:TimeInterval?
    
    public static let shared = LKRRMSConstants()
    private override init() {
        APIMainURL = "https://rapidrmseast-rapidrmsmodulewise.azurewebsites.net/WcfService/Service.svc"
        DatabaseName = "RapidRMS181015"
    }
}
