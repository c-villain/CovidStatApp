//
//  CountryRow.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI
import Covid19NetworkKit

struct CountryRow: View {
    
    let country: Country
    
    var body: some View {
        HStack{
            VStack (alignment: .leading){
                Text("\(country.country ?? "")").font(.headline)
                Text("total confirmed: \(country.totalConfirmed ?? 0)")
                Text("total deaths: \(country.totalDeaths ?? 0)")
                Text("new confirmed: \(country.newConfirmed ?? 0)")
            }
        }
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(country: Country(country: "Belgium", countryCode: "BE", slug: "belgium", newConfirmed: 0, totalConfirmed: 52011, newDeaths: 0, totalDeaths: 8521, newRecovered: 0, totalRecovered: 13201, date: "2020-05-09T09:48:33Z"))
    }
}
