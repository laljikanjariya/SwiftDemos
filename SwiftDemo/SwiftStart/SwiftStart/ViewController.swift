//
//  ViewController.swift
//  SwiftStart
//
//  Created by Siya Infotech on 17/06/15.
//  Copyright (c) 2015 Siya Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var testLabel: UILabel!
    @IBOutlet var userName: UITextField!
    @IBOutlet var userPassword: UITextField!
    var testGloble : NSArray!
    var userInfo : NSMutableDictionary!
    
    
    
    @IBAction func TestButtonTapped(sender: UIButton) {
        if userInfo.objectForKey("id") == nil{
            userInfo.setObject("Lalji", forKey: "id")
            userInfo.setObject("Kanjariya", forKey: "password")
        }

        var message:NSString = NSString(format: "Your ID=%@ and password is =%@",userInfo.valueForKey("id") as String,userInfo.valueForKey("password") as String)
        
        var alert = UIAlertController(title: "Confirmation", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        var okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("OK Pressed")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewControllerWithIdentifier("DetailView_sid") as! UIViewController
            let DV = storyboard.instantiateViewControllerWithIdentifier("DetailView_sid") as UIViewController
//              let DV = DetailView(nibName: "DetailView", bundle: nil)
            self.navigationController?.pushViewController(DV, animated: true)
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
    
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        testLabel.text="done";
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInfo = NSMutableDictionary()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

