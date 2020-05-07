//
//  DMUpdateManager.swift
//  LKHomeCost
//
//  Created by Lalji on 23/09/19.
//  Copyright © 2019 Lalji. All rights reserved.
//

import UIKit
import CoreData
struct DateCompData {
    var day: Int!
    var month: Int!
    var year: Int!
}
class DBUpdateManager: NSObject {
    
    class func createPrivateMOC(_ moc:NSManagedObjectContext) -> NSManagedObjectContext{
        let privateMOC : NSManagedObjectContext = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        privateMOC.parent = moc;
        return privateMOC
    }
    class func saveMOC(_ moc:NSManagedObjectContext?) {
        if let saveMOC = moc {
            if saveMOC.parent == nil {
                saveMOC.perform {
                    save(Context: saveMOC)
                }
            }
            else{
                saveMOC.performAndWait {
                    save(Context: saveMOC)
                }
            }
        }
    }
    private class func save(Context moc:NSManagedObjectContext) {
        do {
            try moc.save()
        } catch {
        }
        saveMOC(moc.parent)
    }
    class func fetchData(entityName entity:String, requestPredicate predicate:NSPredicate?, withMOC moc:NSManagedObjectContext) -> [NSManagedObject] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.predicate = predicate
        return fetchData(withFetchRequest: fetchRequest, withMOC: moc) as! [NSManagedObject]
    }
    class func fetchData(withFetchRequest fetchRequest:NSFetchRequest<NSFetchRequestResult>, withMOC moc:NSManagedObjectContext) -> [Any] {
        var result:[Any] = []
        do {
            try result = moc.fetch(fetchRequest)
        } catch {
        }
        return result
    }
    class func insertData(entityName entity:String, withMOC moc:NSManagedObjectContext) -> NSManagedObject!{
        return NSEntityDescription.insertNewObject(forEntityName: entity, into: moc) as NSManagedObject
    }
}
