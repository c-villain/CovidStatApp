//
//  SummaryObj+CoreDataClass.swift
//  CovidStat
//
//  Created by Alexander Kraev on 10.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData
import Covid19NetworkKit

@objc(SummaryObj)
public class SummaryObj: NSManagedObject {
    convenience init(with summary: Summary?, context: NSManagedObjectContext){
        self.init()
        guard let summary = summary else { return }
//        let obj = SummaryObj(context: context)
        
        self.id = summary.id
        self.summaryGlobal = SummaryGlobalObj.init(with: summary.global)
//        self.countries = Set((summary.countries?.map(CountryObj.init(with: _, context: context)))!)
//        self.countries = Set(summary.countries?.setmap(CountryObj.from(obj:)))
    }
    
//    static func from(obj: Summary) -> SummaryObj {
//        return SummaryObj(global: SummaryGlobal.from(obj: obj.summaryGlobal),
//                       countries: obj.countries?.map(Country.from(obj:)),
//                       date: obj.date)
//    }
}
