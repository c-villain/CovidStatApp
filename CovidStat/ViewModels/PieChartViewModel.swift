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

class PieChartViewModel: ObservableObject {
    
    @Published var pieChartData = PieChartData(data: [Double]())
    
    func generateChartData(summary: SummaryGlobal?) -> Void {
        // reset view
        pieChartData = PieChartData(data: [Double]())
        
        var values: [Double] = []
        
        guard summary != nil else {return }

        values.append(Double(summary?.totalConfirmed ?? 0))
        values.append(Double(summary?.totalRecovered ?? 0))
        values.append(Double(summary?.totalDeaths ?? 0))

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.pieChartData = PieChartData(data: values)
        }
    }
}
