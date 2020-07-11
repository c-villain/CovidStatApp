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
import Covid19NetworkKit

struct SummaryView: View {
    
    @ObservedObject var viewModel: SummaryViewModel
    @ObservedObject var summaryStore: SummaryStore<Summary, SummaryStoreActions>
    
    var pieChartFrameMultiplier: Float{
        get{
            #if targetEnvironment(macCatalyst)
            return 0.6
            #else
            return 0.8
            #endif
        }
    }

    var body: some View {
        NavigationView{
            VStack{
                Text("COVID-19 Summary").font(.largeTitle).bold()

                Text("on: \(summaryStore.state?.formatedDate ?? "")").font(.title)
                
                Group{
                    Text("Total confirmed: \(summaryStore.state?.global?.totalConfirmed ?? 0)").font(.title)
                    Text("Total recovered:  \(summaryStore.state?.global?.totalRecovered ?? 0)").font(.title)
                    Text("Total death: \(summaryStore.state?.global?.totalDeaths ?? 0)").font(.largeTitle)
                }
                
                GeometryReader { geometry in
                    VStack {
                        PieChart(pieChartData: self.summaryStore.pieChartData)
                            .frame(width: geometry.size.width * CGFloat(self.pieChartFrameMultiplier),
                                   height: geometry.size.width * CGFloat(self.pieChartFrameMultiplier))
                            .padding(.top, 20)
                    }
                }
                
            }
            .offset(x: 0, y: -40)
            .navigationBarItems(trailing:
                Button(action: {
                    self.summaryStore.loadSummary()
                }) {
                    Image(systemName: "arrow.clockwise")
                }
            )
            
        } //NavigationView
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let store = SummaryStore<Summary, SummaryStoreActions>(summaryService: SummaryService() as SummaryService){_,_ in return Summary(global: nil, countries: nil, date: nil)}
//        let viewModel = SummaryViewModel(summaryStore: store)
//
//        return SummaryView(viewModel: viewModel, summaryStore: store)
//
//    }
//}
