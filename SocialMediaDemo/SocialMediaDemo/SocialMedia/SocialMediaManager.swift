//
//  SocialMediaManager.swift
//  SocialMediaDemo
//
//  Created by Siya9 on 09/08/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit
import Social

class SocialMediaManager: NSObject {
    
    typealias isUserLoginResponce = (_ success:Bool) -> Void
    
    var delegate:ViewController?
    public var isLoginUserResponce:isUserLoginResponce?
    public class func createManagerWithType() -> SocialMediaManager{
        return FacebookManager()
    }
    public func isUserLogin(inDeviceAccount delegate:ViewController) -> Bool {
        return false
    }
    public func isUserLogin(inSDKAccount delegate:ViewController) -> Bool {
        return false
    }
    public func isUserCanPost(inDeviceAccount delegate:ViewController) {
        
    }
    public func isUserCanPost(inSDKAccount delegate:ViewController) {
        
    }
    public func loginUser(inDeviceAccount delegate:ViewController) {
        
    }
    public func loginUser(inSDKAccount delegate:ViewController) {
        
    }
    public func post(inDeviceAccount delegate:ViewController) {
        
    }
    public func post(inSDKAccount delegate:ViewController) {
        
    }
    public func getUserPorfile(inDeviceAccount delegate:ViewController) {
        
    }
    public func getUserPorfile(inSDKAccount delegate:ViewController) {
        
    }
}
