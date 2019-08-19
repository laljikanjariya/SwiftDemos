//
//  FacebookManager.swift
//  SocialMediaDemo
//
//  Created by Siya9 on 09/08/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit
import Social
import FBSDKLoginKit

class FacebookManager: SocialMediaManager {

    public override func isUserLogin(inDeviceAccount delegate:ViewController) -> Bool {
        return SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
    }
    public override func isUserLogin(inSDKAccount delegate:ViewController) -> Bool {
        return (FBSDKAccessToken.current() != nil)
    }
    public override func isUserCanPost(inDeviceAccount delegate:ViewController) {
        
    }
    public override func isUserCanPost(inSDKAccount delegate:ViewController) {
        
    }
    public override func loginUser(inDeviceAccount delegate:ViewController) {
        let theStore:ACAccountStore = ACAccountStore()
        
        let theFBAccountType:ACAccountType = theStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
        
        let theOptions = ["ACFacebookAppIdKey": "110283096306247", "ACFacebookPermissionsKey": ["email"]] as [String : Any]
        
        theStore.requestAccessToAccounts(with: theFBAccountType, options: theOptions) { (granted:Bool, error:Error?) in
            if granted {
                
                let theFBAccount:ACAccount = (theStore.accounts(with: theFBAccountType) as [Any]).last as! ACAccount
                
                let request:SLRequest = SLRequest.init(forServiceType: SLServiceTypeFacebook, requestMethod:.GET, url:URL.init(string: "https://graph.facebook.com/me"), parameters: ["fields" : ["email","user_about_me"]])
                request.account = theFBAccount;
                
                request.perform(handler: { (data:Data?, response:HTTPURLResponse?, error:Error?) in
                    
                    if error == nil && (response!).statusCode == 200{
                        do {
                            let userData:Dictionary = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                            
                            print(userData)
                            
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                    
                })
            }
            else{
                
            }
        }
    }
    public override func loginUser(inSDKAccount delegate:ViewController) {
        
    }
    public override func post(inDeviceAccount delegate:ViewController) {
        
    }
    public override func post(inSDKAccount delegate:ViewController) {
        
    }
    public override func getUserPorfile(inDeviceAccount delegate:ViewController) {
        
    }
    public override func getUserPorfile(inSDKAccount delegate:ViewController) {
        
    }
}
