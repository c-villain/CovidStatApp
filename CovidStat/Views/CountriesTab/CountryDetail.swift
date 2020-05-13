//
//  CountryDetail.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct CountryDetail: View {
    
    @ObservedObject var viewModel: CasesViewModel
    
    @State var country: Country
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Group{
                    Text("\(country.country ?? "")").font(.title).bold()
                    Spacer()
                    Spacer()
                    Text("new confirmed: \(country.newConfirmed ?? 0)").font(.title)
                    Text("new deaths: \(country.newDeaths ?? 0)").font(.title)
                    Text("new recovered: \(country.newRecovered ?? 0)").font(.title)
                    Text("total confirmed: \(country.totalConfirmed ?? 0)").font(.title)
                    Text("total deaths: \(country.totalDeaths ?? 0)").font(.title)
                    Text("total recovered: \(country.totalRecovered ?? 0)").font(.title)
                }.offset(x: 20, y: 30)
                
                LineView(data: self.viewModel.totalCases.map{Double($0.confirmed               ?? 0)}, title: "Cases chart", legend: "Total confirmed").padding().offset(x: 0, y: -20).onAppear(){
                    self.viewModel.loadAllCases(countrySlug: self.country.slug ?? "")
                }
                
                Spacer()
                Spacer()
            }
            
        }
    }
}


struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail(viewModel: CasesViewModel(casesService: CasesService() as CasesService), country: Country(country: "Belgium", countryCode: "BE", slug: "belgium", newConfirmed: 0, totalConfirmed: 52011, newDeaths: 0, totalDeaths: 8521, newRecovered: 0, totalRecovered: 13201, date: "2020-05-09T09:48:33Z"))
    }
}

