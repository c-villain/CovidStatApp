//
//  Constants.swift
//  CovidStat
//
//  Created by Alexander Kraev on 17.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation

struct Constants {
    struct CountryDetailLegendsConstants{
        static let confirmedText: String = "Confirmed cases stat since first recorded case"
        static let deathText: String = "Death cases stat since first recorded case"
        static let recoveredText: String = "Recovered cases stat since first recorded case"
        static let newCasesText: String = "New cases per day stat since first recorded case"
        
        static let confirmedIn15DaysText = "Confirmed cases stat for last 15 days"
        static let deathIn15DaysText = "Death cases stat for last 15 days"
        static let recoveredIn15DaysText = "Recovered cases stat for last 15 days"
        static let newCasesIn15DaysText = "New cases per day stat for last 15 days"
        
        static let confirmedIn10DaysText = "Confirmed cases stat for last 10 days"
        static let deathIn10DaysText = "Death cases stat for last 10 days"
        static let recoveredIn10DaysText = "Recovered cases stat for last 10 days"
        static let newCasesIn10DaysText = "New cases per day stat for last 10 days"
    }
}
