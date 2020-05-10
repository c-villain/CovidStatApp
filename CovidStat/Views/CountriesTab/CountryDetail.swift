//
//  CountryDetail.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

struct CountryDetail: View {
    
    let country: Country
    
    var body: some View {
        NavigationView {
            VStack{
                Text("new confirmed: \(country.newConfirmed ?? 0)").font(.title)
                
                Text("new deaths: \(country.newDeaths ?? 0)").font(.title)
                
                Text("total recovered: \(country.newRecovered ?? 0)").font(.title)
                
                Text("total confirmed: \(country.totalConfirmed ?? 0)").font(.title)
               
                Text("total deaths: \(country.totalDeaths ?? 0)").font(.title)
                
                Text("total recovered: \(country.totalRecovered ?? 0)").font(.title)
                
                Spacer()

            }
        } //NavigationView
            .navigationBarTitle("\(country.country ?? " ")").font(.headline)
    }
}


struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail(country: Country(country: "Belgium", countryCode: "BE", slug: "belgium", newConfirmed: 0, totalConfirmed: 52011, newDeaths: 0, totalDeaths: 8521, newRecovered: 0, totalRecovered: 13201, date: "2020-05-09T09:48:33Z"))
    }
}

