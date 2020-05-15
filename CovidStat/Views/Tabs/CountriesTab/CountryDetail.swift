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
    
    @ObservedObject var casesViewModel: CasesViewModel
    
    @State var country: Country
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Group{
                    Text("\(country.country ?? "")").font(.title).bold()
                    Spacer()
                    
                    Text("new confirmed: \(country.newConfirmed ?? 0)").font(.custom("", size: 22))
                    Text("new deaths: \(country.newDeaths ?? 0)").font(.custom("", size: 22))
                    Text("new recovered: \(country.newRecovered ?? 0)").font(.custom("", size: 22))
                    Text("total confirmed: \(country.totalConfirmed ?? 0)").font(.custom("", size: 22))
                    Text("total deaths: \(country.totalDeaths ?? 0)").font(.custom("", size: 22))
                    Text("total recovered: \(country.totalRecovered ?? 0)").font(.custom("", size: 22) )
                }.offset(x: 20, y: 20)
                
                ScrollView(.vertical, showsIndicators: true){
                    VStack(spacing: 150){
                        LineView(data: self.casesViewModel.totalCases.map{Double($0.confirmed               ?? 0)}, title: "Total confirmed", legend: "Confirmed cases stat since first recorded case").padding().offset(x: 0, y: 20).onAppear(){
                            self.casesViewModel.clearCases()
                            self.casesViewModel.loadAllCases(countrySlug: self.country.slug ?? "")}
                        
                        Spacer()
                        LineView(data: self.casesViewModel.totalCases.map{Double($0.deaths               ?? 0)}, title: "Total death", legend: "Death cases stat since first recorded case").padding().offset(x: 0, y: 20)
                        
                        Spacer()
                        LineView(data: self.casesViewModel.totalCases.map{Double($0.recovered               ?? 0)}, title: "Total recovered", legend: "Recovered cases stat since first recorded case").padding().offset(x: 0, y: 20)
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }.offset(x: 0, y: 20)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.casesViewModel.clearCases()
                        self.casesViewModel.loadAllCases(countrySlug: self.country.slug ?? "")
                    }) {
                        Image(systemName: "arrow.clockwise")
                    }
                )
            }
        }
    }
}


struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail(casesViewModel: CasesViewModel(casesService: CasesService() as CasesService), country: Country(country: "Belgium", countryCode: "BE", slug: "belgium", newConfirmed: 0, totalConfirmed: 52011, newDeaths: 0, totalDeaths: 8521, newRecovered: 0, totalRecovered: 13201, date: "2020-05-09T09:48:33Z"))
    }
}

