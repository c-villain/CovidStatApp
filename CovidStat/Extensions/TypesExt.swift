//
//  TypesExt.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation

extension Summary: Identifiable {
    public var id: String {
        UUID().uuidString
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
}

extension Country: Identifiable {
  public var id: String {
    UUID().uuidString
  }
}
