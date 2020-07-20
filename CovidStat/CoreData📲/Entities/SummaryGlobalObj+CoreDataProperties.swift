//
//  SummaryGlobalObj+CoreDataProperties.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData


extension SummaryGlobalObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummaryGlobalObj> {
        return NSFetchRequest<SummaryGlobalObj>(entityName: "SummaryGlobalObj")
    }

    @NSManaged public var id: String?
    @NSManaged public var newConfirmed: Int32
    @NSManaged public var totalConfirmed: Int64
    @NSManaged public var newDeaths: Int32
    @NSManaged public var totalDeaths: Int32
    @NSManaged public var newRecovered: Int32
    @NSManaged public var totalRecovered: Int32
    @NSManaged public var origin: SummaryObj?

}
