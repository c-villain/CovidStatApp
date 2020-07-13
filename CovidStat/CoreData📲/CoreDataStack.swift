//
//  CoreDataStack.swift
//  CovidStat
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Core Data stack

public class CoreDataStack {
    
    public static let shared = CoreDataStack()
        
    var mainContext: NSManagedObjectContext {
        let container = persistentContainer
        let context = container.viewContext
        context.mergePolicy = NSMergePolicy.overwrite
        return context
    }
    
    //wrapper on CoreData stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CovidCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
