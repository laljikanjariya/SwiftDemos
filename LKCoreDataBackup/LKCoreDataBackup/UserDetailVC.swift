//
//  UserDetailVC.swift
//  LKCoreDataBackup
//
//  Created by Lalji on 06/05/20.
//  Copyright © 2020 Lalji. All rights reserved.
//

import UIKit
import CoreData

class UserDetailVC: UIViewController {
    var userData:Users!
    var privateMOC:NSManagedObjectContext!
    @IBOutlet weak var txtFName:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtFName.text = userData.fName
    }
    @IBAction func back(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func saveData(_ sender: UIButton){
        if txtFName.text?.count ?? 0 > 0 {
            userData.fName = txtFName.text
            DBUpdateManager.saveMOC(privateMOC)
        }
        back(sender)
    }
    @IBAction func deleteUserData(_ sender: UIButton){
        privateMOC.delete(userData)
        DBUpdateManager.saveMOC(privateMOC)
        back(sender)
    }
}
