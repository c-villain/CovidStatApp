//
//  MainViewBuilder.swift
//  CovidStat
//
//  Created by Alexander Kraev on 17.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI

protocol Builder {
    static func createView() -> AnyView
}

class MainViewBuilder : Builder{
    static func createView() -> AnyView {
        let locator = ServiceLocator()
        let summaryService = SummaryService(context: CoreDataStack.shared.mainContext) as SummaryService
        locator.registerService(service: summaryService)
        locator.registerService(service: CasesService() as CasesServiceProtocol)
        
        let store = SummaryStore(summaryService: summaryService)
        
        let viewModel = SummaryViewModel(summaryStore: store)
        let casesViewModel = CasesViewModel(casesService: locator.getService())
                
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(viewModel)
            .environmentObject(casesViewModel)
            .environmentObject(store)
            .environmentObject(locator)
            .environment(\.managedObjectContext, CoreDataStack.shared.mainContext)
        return AnyView(contentView)
    }
    
    
}
