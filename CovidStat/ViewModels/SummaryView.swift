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
                Text("on: \(viewModel.summary?.formatedDate ?? "")").font(.largeTitle)
                Spacer()
                Text("Total death: \(viewModel.summary?.global?.totalDeaths ?? 0)").font(.title)
                Text("Total confirmed: \(viewModel.summary?.global?.totalConfirmed ?? 0)").font(.title)
                Text("Total recovered:  \(viewModel.summary?.global?.totalRecovered ?? 0)").font(.title)
                Spacer()
            }
            .navigationBarTitle("COVID-19 Summary")
        }

    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(viewModel: SummaryViewModel(summaryService: SummaryService() as SummaryService))
    }
}
