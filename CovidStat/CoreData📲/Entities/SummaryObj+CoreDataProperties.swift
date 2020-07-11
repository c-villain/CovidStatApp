//
//  SummaryObj+CoreDataProperties.swift
//  CovidStat
//
//  Created by Alexander Kraev on 10.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData


extension SummaryObj {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummaryObj> {
        return NSFetchRequest<SummaryObj>(entityName: "SummaryObj")
    }

    @NSManaged public var id: String?
    @NSManaged public var date: String?
    @NSManaged public var countries: Set<CountryObj>?
    @NSManaged public var summaryGlobal: SummaryGlobalObj?

}

// MARK: Generated accessors for countries
extension SummaryObj {

    @objc(addCountriesObject:)
    @NSManaged public func addToCountries(_ value: CountryObj)

    @objc(removeCountriesObject:)
    @NSManaged public func removeFromCountries(_ value: CountryObj)

    @objc(addCountries:)
    @NSManaged public func addToCountries(_ values: NSSet)

    @objc(removeCountries:)
    @NSManaged public func removeFromCountries(_ values: NSSet)

}
