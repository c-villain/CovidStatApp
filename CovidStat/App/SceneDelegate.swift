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
        
        guard let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else{
            fatalError("Unable to read persistent container context.")
        }
        
        let locator = ServiceLocator()
        let summaryService = SummaryService(context: context) as SummaryService
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
            .environment(\.managedObjectContext, context)
        
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
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

