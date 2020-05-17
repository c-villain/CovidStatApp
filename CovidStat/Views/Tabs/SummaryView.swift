//
//  SummaryView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI
import SwiftUIRefresh
import SwiftUICharts

struct SummaryView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    var body: some View {
        NavigationView{
            VStack{
                Text("COVID-19 Summary").font(.largeTitle).bold()
                Spacer()
                Text("on: \(self.viewModel.summary?.formatedDate ?? "")").font(.title)
                
                Group{
                    Text("Total confirmed: \(self.viewModel.summary?.global?.totalConfirmed ?? 0)").font(.title)
                    Text("Total recovered:  \(self.viewModel.summary?.global?.totalRecovered ?? 0)").font(.title)
                    Text("Total death: \(self.viewModel.summary?.global?.totalDeaths ?? 0)").font(.largeTitle)
                }
                
                GeometryReader { geometry in
                    VStack {
                        PieChart(pieChartData: self.viewModel.pieChartData)
                            .frame(width: geometry.size.width * 0.8,
                                   height: geometry.size.width * 0.8)
                            .padding(.top, 20)
                    }
                }
                
            }
            .offset(x: 0, y: -40)
            .navigationBarItems(trailing:
                Button(action: {
                    self.viewModel.loadSummary()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
            
        } //NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
