//
//  CountriesView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 09.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

struct CountriesView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    
    @State private var searchCountry : String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(text: $searchCountry)
                
                List(viewModel.summary?.countries ?? [Country]()) {
                    
                    country in NavigationLink(
                    destination: CountryDetail(country: country)){
                        CountryRow(country: country)
                    }
                }//List
            }
            .navigationBarTitle("Countries", displayMode: .inline)
        } //NavigationView
    } //some View
} //View

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
