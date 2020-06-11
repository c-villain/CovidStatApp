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
        static let confirmedText = "Confirmed cases stat since first recorded case"
        static let deathText = "Death cases stat since first recorded case"
        static let recoveredText = "Recovered cases stat since first recorded case"
        static let newCasesText = "New cases per day stat since first recorded case"
        
        static let confirmedIn15DaysText = "Confirmed cases stat for last 15 days"
        static let deathIn15DaysText = "Death cases stat for last 15 days"
        static let recoveredIn15DaysText = "Recovered cases stat for last 15 days"
        static let newCasesIn15DaysText = "New cases per day stat for last 15 days"
        
        static let confirmedIn10DaysText = "Confirmed cases stat for last 10 days"
        static let deathIn10DaysText = "Death cases stat for last 10 days"
        static let recoveredIn10DaysText = "Recovered cases stat for last 10 days"
        static let newCasesIn10DaysText = "New cases per day stat for last 10 days"
    }
    
    struct AboutConstants{
        static let github = "https://github.com/c-villain/CovidStatApp"
        static let api = "https://covid19api.com"
        static let email = "lexkraev@gmail.com"
        static let tg = "t.me/cvillain"
        static let JHApi = "https://github.com/CSSEGISandData/COVID-19"
        static let privacyPolicy = "https://raw.githubusercontent.com/c-villain/CovidStatApp/master/PrivacyPolicy.txt"
    }
}
