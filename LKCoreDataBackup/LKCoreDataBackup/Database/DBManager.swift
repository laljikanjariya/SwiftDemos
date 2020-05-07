//
//  DBManager.swift
//  LKHomeCost
//
//  Created by Lalji on 23/09/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import CoreData
class DBManager: NSObject {
    static var shared = DBManager()
    
    
    private override init(){}
    // MARK: - Core Data stack
    var managedObjectContext: NSManagedObjectContext {
        persistentContainer.viewContext;
    }
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creatertion of the store to fail.
        */
        let container = NSPersistentContainer(name: "LKCoreDataBackup")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func backupContext (backupPath: URL?) {
        var backupStorePath = backupPath
        if backupStorePath == nil {
            var backUpFolderUrl = FileManager.default.urls(for: .documentDirectory, in:.userDomainMask).first!
            backUpFolderUrl.appendPathComponent("Backups")
            do {
                try FileManager.default.createDirectory(at: backUpFolderUrl, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Failed to create")
            }
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = NSTimeZone.default
            dateFormatter.dateFormat = "yyyy-MM-dd-hh-mm"

            backupStorePath = backUpFolderUrl.appendingPathComponent("LKCoreDataBackup" + dateFormatter.string(from: Date()) + ".sqlite")

        }
        let store:NSPersistentStore
        store = persistentContainer.persistentStoreCoordinator.persistentStores.last!
        do {
            try persistentContainer.persistentStoreCoordinator.migratePersistentStore(store,to: backupStorePath!,options: nil,withType: NSSQLiteStoreType)
        } catch {
            print("Failed to migrate")
        }
    }
    func restoreBackupContext (backupPath: URL) {

        let storeFolderUrl = FileManager.default.urls(for: .applicationSupportDirectory, in:.userDomainMask).first!
        let storeUrl = storeFolderUrl.appendingPathComponent("LKCoreDataBackup.sqlite")

//        let stores = persistentContainer.persistentStoreCoordinator.persistentStores
        do{
            try persistentContainer.persistentStoreCoordinator.replacePersistentStore(at: storeUrl,destinationOptions: nil,withPersistentStoreFrom: backupPath,sourceOptions: nil,ofType: NSSQLiteStoreType)
            print("Restart app")
        } catch {
            print("Failed to restore")
        }
    }
}
