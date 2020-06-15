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
import Covid19NetworkKit

struct CountriesView: View {
    
    @ObservedObject var summaryStore: SummaryStore<Summary, SummaryStoreActions>
    @ObservedObject var viewModel: SummaryViewModel
    @ObservedObject var casesViewModel: CasesViewModel
    @EnvironmentObject var locator: ServiceLocator
    
    @State private var searchCountry : String = ""
    
    @State private var isShowing = false
    var body: some View {
        
        NavigationView{
            VStack{
                SearchBar(text: $searchCountry, placeholder: "Search country")
                List((self.viewModel.summaryStore.state?.countries ?? [Country]()).filter{
                    searchCountry.isEmpty ? true :
                        ($0.country?.lowercased().starts(with: searchCountry.lowercased()) ?? true)
                }, id: \.country){
                    country in NavigationLink(
                        destination: CountryDetailView(casesViewModel: self.casesViewModel,
                                                   country: country)){
                                                    CountryRow(country: country)
                    }
                    
                }//List
                    .pullToRefresh(isShowing: $isShowing) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.summaryStore.loadSummary()
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
        .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)})
        .navigationViewStyle(StackNavigationViewStyle())
    } //some View
} //View

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = SummaryStore<Summary, SummaryStoreActions>(summaryService: SummaryService() as SummaryService){_,_ in return Summary(global: nil, countries: nil, date: nil)}
        let viewModel = SummaryViewModel(summaryStore: store)
        let casesViewModel = CasesViewModel(casesService: CasesService() as CasesService)
        
        return CountriesView(summaryStore: store, viewModel: viewModel, casesViewModel: casesViewModel)

    }
}
