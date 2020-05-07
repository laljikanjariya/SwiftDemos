//
//  LKRRMSDBLoader.swift
//  LKRapidRMS-DB
//
//  Created by Lalji on 29/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import CoreData

public class LKRRMSDBLoader: NSObject {
    static let shared = LKRRMSDBLoader()

    //Initializer access level change now
    private override init(){
        
        print("LKRRMSDBLoader init")
    }
    
    lazy var operationBG: OperationQueue = {
        let operationBG = OperationQueue()
        operationBG.qualityOfService = .background
        operationBG.name = "DatabaseBGQueue"
        return operationBG
    }()
    lazy var operationMain: OperationQueue = {
        let operationMain = OperationQueue()
        operationMain.qualityOfService = .userInteractive
        operationMain.name = "DatabaseMainQueue"
        return operationMain
    }()
    
    class func preivateMOC(withParent parentContext:NSManagedObjectContext) -> NSManagedObjectContext {
        let childContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        childContext.parent = parentContext
        return childContext
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        
        let momdName = "LKRapidRMS_DB" //pass this as a parameter
        //...

        guard let modelURL = Bundle(for: type(of: self)).url(forResource: momdName, withExtension:"momd") else {
                fatalError("Error loading model from bundle")
        }

        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }

        let container = NSPersistentContainer(name: momdName, managedObjectModel: mom)
        
//        let container = NSPersistentContainer(name: "LKRapidRMS_DB")
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
}
