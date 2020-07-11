//
//  CountryObj+CoreDataClass.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData
import Covid19NetworkKit

@objc(CountryObj)
public class CountryObj: NSManagedObject {
    convenience required init(with country: Country?, context: NSManagedObjectContext){
        self.init(context: context)
        guard let country = country else { return }
        self.id = country.id
        self.country = country.country
        self.countryCode = country.countryCode
        self.slug = country.slug
        self.newConfirmed = Int32(country.newConfirmed ?? 0)
        self.totalConfirmed = Int32(country.totalConfirmed ?? 0)
        self.newDeaths = Int32(country.newDeaths ?? 0)
        self.totalDeaths = Int32(country.totalDeaths ?? 0)
        self.newRecovered = Int32(country.newRecovered ?? 0)
        self.totalRecovered = Int32(country.totalRecovered ?? 0)
        self.date = country.date
    }
    
    static func from(obj: Country, context: NSManagedObjectContext) -> CountryObj {
        return CountryObj(with: obj, context: context)
    }
}
