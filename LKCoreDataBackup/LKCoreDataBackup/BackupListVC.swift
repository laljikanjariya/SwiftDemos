//
//  BackupListVC.swift
//  LKCoreDataBackup
//
//  Created by Lalji on 06/05/20.
//  Copyright © 2020 Lalji. All rights reserved.
//

import UIKit

class BackupListVC: UIViewController {
    var backupFiles:[URL] = [URL]()
    @IBOutlet weak var tblBackupList: UITableView!
    var restoreURL:URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBackupFiles()
    }
    func loadBackupFiles() {
        // Get the document directory url
        var documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        documentsUrl.appendPathComponent("Backups")
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
            
            print(directoryContents)

            // if you want to filter the directory contents you can do like this:
            backupFiles = directoryContents.filter{ $0.pathExtension == "sqlite" }


        } catch {
            print(error)
        }
        print(backupFiles)
    }
    @IBAction func backupUserData(_ sender: UIButton){
        DBManager.shared.backupContext(backupPath: nil)
        loadBackupFiles()
        tblBackupList.reloadData()
    }
    @IBAction func restoreUserData(_ sender: UIButton){
        if let backupURL = restoreURL {
            DBManager.shared.restoreBackupContext(backupPath: backupURL)
        }
    }
}
extension BackupListVC: UITableViewDelegate,UITableViewDataSource {

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = backupFiles[indexPath.row].lastPathComponent
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backupFiles.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        restoreURL = backupFiles[indexPath.row]
    }
}
