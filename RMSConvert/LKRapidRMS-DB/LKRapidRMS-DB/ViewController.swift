//
//  ViewController.swift
//  LKRapidRMS-DB
//
//  Created by Lalji on 29/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import LKRRMSDB
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        LKRRMSDBManager.shared.checkDatabase(self.navigationController!)
    }
}
