//
//  UserListVC.swift
//  LKCoreDataBackup
//
//  Created by Lalji on 06/05/20.
//  Copyright © 2020 Lalji. All rights reserved.
//

import UIKit
import CoreData
class UserListVC: UIViewController {
    @IBOutlet weak var tblUserList: UITableView!
    var mainMOC : NSManagedObjectContext = DBManager.shared.managedObjectContext
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try userListRC.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to Perform Fetch Request")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainMOC = DBManager.shared.managedObjectContext
        tblUserList.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    /// transaction list result controller
    fileprivate lazy var userListRC: NSFetchedResultsController<Users> = {
        
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        var entity = NSEntityDescription.entity(forEntityName: "Users", in: mainMOC)
        fetchRequest.entity = entity
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "fName", ascending: false)]
        
        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: mainMOC, sectionNameKeyPath: nil, cacheName: nil)
        
        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self
        
        return fetchedResultsController as! NSFetchedResultsController<Users>
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateUser" {
            let  cell = sender as! UITableViewCell
            let indexPath:IndexPath = tblUserList.indexPath(for: cell)!
            let objUser = userListRC.object(at: indexPath)
            let mocPrivate = DBUpdateManager.createPrivateMOC(mainMOC)
            let destination = segue.destination as! UserDetailVC
            destination.privateMOC = mocPrivate
            destination.userData = mocPrivate.object(with: objUser.objectID) as? Users
        }
        else if segue.identifier == "addUser" {
            let mocPrivate = DBUpdateManager.createPrivateMOC(mainMOC)
            let objUser = DBUpdateManager.insertData(entityName: "Users", withMOC: mocPrivate)
            let destination = segue.destination as! UserDetailVC
            destination.privateMOC = mocPrivate
            destination.userData = objUser as? Users
        }
    }
}
extension UserListVC: UITableViewDelegate,UITableViewDataSource {
    
    /// configure department list cell
    ///
    /// - Parameters:
    ///   - tableView: department list table view
    ///   - indexPath: index path
    /// - Returns: department display cell
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let user = userListRC.object(at: indexPath)
        cell?.textLabel?.text = user.fName
        return cell!
    }
    
    /// number of row for section
    ///
    /// - Parameters:
    ///   - tableView: department list table view
    ///   - section: section
    /// - Returns: number of row in given section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = userListRC.sections
        let sectionInfo = sections?[section]
        return sectionInfo?.numberOfObjects ?? 0
    }
}
extension UserListVC: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tblUserList.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tblUserList.insertRows(at: [indexPath], with: .automatic)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                tblUserList.deleteRows(at: [indexPath], with: .automatic)
            }
            break;
        case .update:
            if let indexPath = indexPath {
                tblUserList.reloadRows(at: [indexPath], with: .automatic)
            }
            break;
        case .move:
            if let newIndexPath = newIndexPath {
                if let indexPath = indexPath {
                    tblUserList.deleteRows(at: [indexPath], with: .automatic)
                    tblUserList.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
            break;
        default: break
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tblUserList.endUpdates()
    }
}
