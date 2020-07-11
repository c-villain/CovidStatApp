//
//  TypesExt.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

extension Summary: Identifiable {
    public var id: String {
        UUID().uuidString
    }
    
    static func from(obj: SummaryObj) -> Summary {
        return Summary(global: SummaryGlobal.from(obj: obj.summaryGlobal),
                       countries: obj.countries?.map(Country.from(obj:)),
                       date: obj.date)
    }
    
    public var formatedDate: String{
        guard self.date != nil else {return ""}
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: self.date!) {
            formatter.dateFormat = "MMM dd yyyy"
            return formatter.string(from: date)
        }
        return ""
    }
}

extension SummaryGlobal:  Identifiable {
    public var id: String {
        UUID().uuidString
    }

    
    static func from(obj: SummaryGlobalObj?) -> SummaryGlobal? {
        guard let obj = obj else {return nil}
        return SummaryGlobal(newConfirmed: Int(obj.newConfirmed),
                             totalConfirmed: Int(obj.totalConfirmed),
                             newDeaths: Int(obj.newDeaths),
                             totalDeaths: Int(obj.totalDeaths),
                             newRecovered: Int(obj.newRecovered),
                             totalRecovered: Int(obj.totalRecovered))
    }
}

extension Country: Identifiable {
  public var id: String {
    UUID().uuidString
  }
    
    static func from(obj: CountryObj) -> Country {
        return Country(country: obj.country,
                       countryCode: obj.countryCode,
                       slug: obj.slug,
                       newConfirmed: Int(obj.newConfirmed),
                       totalConfirmed: Int(obj.totalConfirmed),
                       newDeaths: Int(obj.newDeaths),
                       totalDeaths: Int(obj.totalDeaths),
                       newRecovered: Int(obj.newRecovered),
                       totalRecovered: Int(obj.totalRecovered),
                       date: obj.date)
    }
}
