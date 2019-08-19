//
//  LKMenuVC.swift
//  MenuDemo
//
//  Created by Siya9 on 17/05/17.
//  Copyright © 2017 Siya9. All rights reserved.
//

import UIKit

enum FrontViewPosition : Int {
    case leftSide
    case rightSide
}
class LKMenuVC: UIViewController {
    var displayVC: UIViewController?
    var menuVC: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func leftMenuShowHideMenu(_ sender: Any) {
        
    }
}

// MARK: - UIViewController(SWRevealViewController) Category
// A category of UIViewController to let childViewControllers easily access their parent SWRevealViewController
extension UIViewController {
    func revealViewController() -> LKMenuVC {
        var parent: UIViewController? = self
        while !(parent is LKMenuVC) && ( nil != (parent = parent?.parent)) {
        }
        return (parent as! LKMenuVC)
    }
}
