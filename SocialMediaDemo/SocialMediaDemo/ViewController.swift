//
//  ViewController.swift
//  SocialMediaDemo
//
//  Created by Siya9 on 09/08/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let facebookManager:SocialMediaManager = SocialMediaManager.createManagerWithType()
        facebookManager.isLoginUserResponce = { (success:Bool) in
            print("Lalji Kanjariya")
            print(success)
        }
        let isLogina = facebookManager.isUserLogin(inDeviceAccount: self)
        print(isLogina)
        let isLogin = facebookManager.isUserLogin(inSDKAccount: self)
        print(isLogin)
        
        facebookManager.loginUser(inDeviceAccount: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

