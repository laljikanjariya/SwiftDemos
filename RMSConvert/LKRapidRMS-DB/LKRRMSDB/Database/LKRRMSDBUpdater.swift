//
//  LKRRMSDBUpdater.swift
//  LKRapidRMS-DB
//
//  Created by Lalji on 29/11/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import CoreData
class LKRRMSDBUpdater: NSObject {
//    insert
    
//    MARK:- Core Data Saving support -
    class public func saveContext(_ context:NSManagedObjectContext?) {
        if let moc:NSManagedObjectContext = context {
            if moc.parent == nil {
                moc.perform {
                    LKRRMSDBUpdater.save(moc)
                }
            }
            else{
                moc.performAndWait {
                    LKRRMSDBUpdater.save(moc)
                }
            }
        }
    }
    class func save(_ context:NSManagedObjectContext) {
        do{
            try context.save()
        }
        catch {
            print("Save: Non recoverable error occured.")
        }
        LKRRMSDBUpdater.saveContext(context.parent)
    }
    
//MARK: - Fetch function -
    class public func insertEntity(name entityName:String, into moc:NSManagedObjectContext) -> NSManagedObject{
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: moc)
        return NSManagedObject(entity: entity!, insertInto: moc)
    }
    class public func fetchEntity(name entityName:String, condition predicate:NSPredicate?, from moc:NSManagedObjectContext, needToCreate isCreate:Bool) -> NSManagedObject? {
        let result = LKRRMSDBUpdater.fetchEntity(name: entityName, condition: predicate, from: moc)
        if result.count > 0 {
            return result.first
        }
        else if isCreate {
            return insertEntity(name: entityName, into: moc)
        }
        else{
            return nil
        }
    }
    class public func fetchEntity(name entityName:String, condition predicate:NSPredicate?, from moc:NSManagedObjectContext) -> [NSManagedObject] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        return fetchEntity(fetchRequest: request, from: moc)
    }
    class public func fetchEntity(fetchRequest request:NSFetchRequest<NSFetchRequestResult>, from moc:NSManagedObjectContext) -> [NSManagedObject] {
        var returnData:[NSManagedObject]
        do {
            let result = try moc.fetch(request)
            returnData = result as! [NSManagedObject]
        }
        catch {
            returnData = [NSManagedObject]()
            print("Failed")
        }
        return returnData
    }
}
