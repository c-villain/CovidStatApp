//
//  TotalCountryCasesObj+CoreDataProperties.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData


extension TotalCountryCasesObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TotalCountryCasesObj> {
        return NSFetchRequest<TotalCountryCasesObj>(entityName: "TotalCountryCasesObj")
    }

    @NSManaged public var country: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var confirmed: Int32
    @NSManaged public var deaths: Int32
    @NSManaged public var recovered: Int32
    @NSManaged public var active: Int32
    @NSManaged public var date: String?

}
