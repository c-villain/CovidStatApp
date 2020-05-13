//
//  SummaryView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct SummaryView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    
    var body: some View {
        
        NavigationView {
            VStack{
                Text("on: \(self.viewModel.summary?.formatedDate ?? "")").font(.title)
                Spacer()
                Text("Total confirmed: \(self.viewModel.summary?.global?.totalConfirmed ?? 0)").font(.title)
                Text("Total recovered:  \(self.viewModel.summary?.global?.totalRecovered ?? 0)").font(.title)
                Text("Total death: \(self.viewModel.summary?.global?.totalDeaths ?? 0)").font(.largeTitle)
                Spacer()
                PieChartView(data:
                    [Double(self.viewModel.summary?.global?.totalDeaths ?? 0),
                     Double(self.viewModel.summary?.global?.totalConfirmed ?? 0),
                     Double(self.viewModel.summary?.global?.totalRecovered ?? 0)],
                             title: "Stat components",
                             style: Styles.pieChartStyleOne,
                             form: ChartForm.medium)
                Spacer()
            }
            .navigationBarTitle("COVID-19 Summary")
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.loadSummary()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
        } //NavigationView
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
