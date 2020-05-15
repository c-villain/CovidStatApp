//
//  CountriesView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftUIRefresh

struct CountriesView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    @ObservedObject var casesViewModel: CasesViewModel
    @EnvironmentObject var locator: ServiceLocator
    
    @State private var searchCountry : String = ""
    
    @State private var isShowing = false
    var body: some View {
        
        NavigationView{
            VStack{
                SearchBar(text: $searchCountry, placeholder: "Search country")
                List((self.viewModel.summary?.countries ?? [Country]()).filter{
                    searchCountry.isEmpty ? true :
                        ($0.country?.lowercased().starts(with: searchCountry.lowercased()) ?? true)
                }, id: \.country){
                    country in NavigationLink(
                        destination: CountryDetail(casesViewModel: self.casesViewModel,
                                                   country: country)){
                                                    CountryRow(country: country)
                    }
                    
                }//List
                    .pullToRefresh(isShowing: $isShowing) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.viewModel.loadSummary()
                            self.isShowing = false
                        }
                }
            } //VStack
                .navigationBarTitle("Countries", displayMode: .inline)
                .navigationBarItems(trailing:
                    HStack{
                        Button(action: {
                            self.viewModel.sortCountriesByDailyCases()
                        }) {
                            Image(systemName: "chevron.down.circle.fill")
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Button(action: {
                            self.viewModel.sortCountriesByTotalDeath()
                        }) {
                            Image(systemName: "person.badge.minus.fill")
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Button(action: {
                            self.viewModel.sortCountriesInAlphabeticalOrder()
                        }) {
                            Image(systemName: "textformat.abc")
                        }}
            )
        } //NavigationView
    } //some View
} //View

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService), casesViewModel: CasesViewModel(casesService: CasesService() as CasesService))
    }
}
