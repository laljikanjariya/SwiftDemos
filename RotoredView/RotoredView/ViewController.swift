//
//  ViewController.swift
//  RotoredView
//
//  Created by Siya9 on 16/03/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    @IBOutlet weak var viewRoted: UIView!
    @IBOutlet weak var viewTryAgain: UIView!
    private var _isLoadingData:Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.checkInternetAndUpdateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var isLoadingData:Bool{
        set {
            if _isLoadingData != newValue {
                _isLoadingData = newValue
                OperationQueue.main.addOperation {
                    self.viewTryAgain.isHidden = newValue
                    self.startLoadingData()
                }
            }
        }
        get {return _isLoadingData}
    }
    func startLoadingData() {
        if isLoadingData {
            WebConnection.loadPostRequest("https://www.google.co.in", param: nil, responce: { (data, response, error) -> Void in
                if data != nil{
                    let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                    print(result)
                }
                else{
                    self.isLoadingData = false
                }
                self.isLoadingData = false
            })
        }
        self.rotateView()
    }
    func rotateView() {
        if isLoadingData {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear, animations: { () -> Void in
                self.viewRoted.transform = self.viewRoted.transform.rotated(by: CGFloat(M_PI_2))
            }) { (finished) -> Void in
                self.rotateView()
            }
        }
    }
    @IBAction func loadLocationDataFromServer(_ sender: Any) {
        self.checkInternetAndUpdateData()
    }
    func checkInternetAndUpdateData() {        
        AFNetworkReachabilityManager.shared().setReachabilityStatusChange { (status: AFNetworkReachabilityStatus) -> Void in
            switch status {
            case .notReachable:
                print("Not reachable")
                self.isLoadingData = false;
            case .reachableViaWiFi, .reachableViaWWAN:
                self.isLoadingData = true;
                print("Reachable")
            case .unknown:
                print("Unknown")
                self.isLoadingData = false;
            }
            AFNetworkReachabilityManager.shared().stopMonitoring()
        }
        AFNetworkReachabilityManager.shared().startMonitoring()
    }
}

