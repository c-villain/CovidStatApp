//
// TotalCountryCases.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation


public struct TotalCountryCases: Codable { 


    public var country: String?
    public var countryCode: String?
    public var confirmed: Int?
    public var deaths: Int?
    public var recovered: Int?
    public var active: Int?
    public var date: String?
    

    public init(country: String?, countryCode: String?, confirmed: Int?, deaths: Int?, recovered: Int?, active: Int?, date: String?) {
        self.country = country
        self.countryCode = countryCode
        self.confirmed = confirmed
        self.deaths = deaths
        self.recovered = recovered
        self.active = active
        self.date = date
    }

    public enum CodingKeys: String, CodingKey, CaseIterable { 
        case country = "Country"
        case countryCode = "CountryCode"
        case confirmed = "Confirmed"
        case deaths = "Deaths"
        case recovered = "Recovered"
        case active = "Active"
        case date = "Date"
    }

}
