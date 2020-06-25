//
//  SceneDelegate.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import UIKit
import SwiftUI
import Covid19NetworkKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let locator = ServiceLocator()
        let summaryService = SummaryService() as SummaryService
        locator.registerService(service: summaryService)
        locator.registerService(service: CasesService() as CasesService)
        
        let store = SummaryStore<Summary, SummaryStoreActions>(summaryService: summaryService){
            previousSummary, action in
            switch action{
                case .AlphabeticalOrder:
                    let sorted = previousSummary.countries?.sorted{
                        $0.country! < $1.country!}
                    return Summary(global: previousSummary.global, countries: sorted, date: previousSummary.date)
                    
                case .DailyCases:
                    let sorted = previousSummary.countries?.sorted{
                        $0.newConfirmed! > $1.newConfirmed!}
                    return Summary(global: previousSummary.global, countries: sorted, date: previousSummary.date)
                    
                case .TotalDeath:
                    let sorted = previousSummary.countries?.sorted{
                        $0.totalDeaths! > $1.totalDeaths!}
                    return Summary(global: previousSummary.global, countries: sorted, date: previousSummary.date)
            }
        }
        
        let viewModel = SummaryViewModel(summaryStore: store)
        let casesViewModel = CasesViewModel(casesService: locator.getService())
                
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView().environmentObject(viewModel)
            .environmentObject(casesViewModel)
            .environmentObject(store)
            .environmentObject(locator)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}

