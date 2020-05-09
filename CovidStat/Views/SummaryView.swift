//
//  SummaryView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("on: \(self.viewModel.summary?.formatedDate ?? "")").font(.title)
                Spacer()
                Text("Total death: \(self.viewModel.summary?.global?.totalDeaths ?? 0)").font(.largeTitle)
                Text("Total confirmed: \(self.viewModel.summary?.global?.totalConfirmed ?? 0)").font(.title)
                Text("Total recovered:  \(self.viewModel.summary?.global?.totalRecovered ?? 0)").font(.title)
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        self.viewModel.loadSummary()
                    }) {
                        Text("Refresh").padding()
                    }.background(Color.white).padding()
                    Spacer()
                }
            }
            .navigationBarTitle("COVID-19 Summary")
        } //NavigationView
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
