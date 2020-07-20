//
//  CountryObj+CoreDataProperties.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData


extension CountryObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryObj> {
        return NSFetchRequest<CountryObj>(entityName: "CountryObj")
    }

    @NSManaged public var id: String?
    @NSManaged public var country: String?
    @NSManaged public var countryCode: String?
    @NSManaged public var slug: String?
    @NSManaged public var newConfirmed: Int32
    @NSManaged public var totalConfirmed: Int32
    @NSManaged public var newDeaths: Int32
    @NSManaged public var totalDeaths: Int32
    @NSManaged public var newRecovered: Int32
    @NSManaged public var totalRecovered: Int32
    @NSManaged public var date: String?
    @NSManaged public var origin: SummaryObj?

}
