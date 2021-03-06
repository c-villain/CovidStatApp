//
// Summary.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import CoreData

public struct Summary: Codable {
    
    public var global: SummaryGlobal?
    public var countries: [Country]?
    public var date: String?

    public init(global: SummaryGlobal?, countries: [Country]?, date: String?) {
        self.global = global
        self.countries = countries
        self.date = date
    }
    
    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}
