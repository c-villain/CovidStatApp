//
//  PieChartViewModel.swift
//  CovidStat
//
//  Created by Alexander Kraev on 14.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

final class PieChartViewModel: ObservableObject {
    
    @Published var pieChartData = PieChartData(data: [Double]())
    
    func generateChartData(_ summaryGlobal: SummaryGlobal?) -> Void {
        
        guard summaryGlobal != nil else {return }
        // reset view
        pieChartData = PieChartData(data: [Double]())
        var values: [Double] = []
        
        values.append(Double(summaryGlobal?.totalConfirmed ?? 0))
        values.append(Double(summaryGlobal?.totalRecovered ?? 0))
        values.append(Double(summaryGlobal?.totalDeaths ?? 0))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.pieChartData = PieChartData(data: values)
        }
    }
}
