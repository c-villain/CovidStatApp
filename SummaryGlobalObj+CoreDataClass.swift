//
//  SummaryGlobalObj+CoreDataClass.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//
//

import Foundation
import CoreData
import Covid19NetworkKit

@objc(SummaryGlobalObj)
public class SummaryGlobalObj: NSManagedObject {
    convenience init(with summaryGlobal: SummaryGlobal?){
        self.init()
        guard let summaryGlobal = summaryGlobal else { return }
        self.id = summaryGlobal.id
        self.newConfirmed = Int32(summaryGlobal.newConfirmed ?? 0)
        self.totalConfirmed = Int64(summaryGlobal.totalConfirmed ?? 0)
        self.newDeaths = Int32(summaryGlobal.newDeaths ?? 0)
        self.totalDeaths = Int32(summaryGlobal.totalDeaths ?? 0)
        self.newRecovered = Int32(summaryGlobal.newRecovered ?? 0)
        self.totalRecovered = Int32(summaryGlobal.totalRecovered ?? 0)
    }
}
