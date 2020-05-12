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
                            destination: CountryDetail(viewModel: CasesViewModel(casesService: self.locator.getService()),
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
        } //NavigationView
    } //some View
} //View

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
