//
//  ContentView.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var locator : ServiceLocator
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection){
            
            SummaryView(viewModel: SummaryViewModel(summaryService: locator.getService()))
                .tag(0)
                .tabItem{
                    VStack{
                        Image (systemName: "globe")
                        Text("Global").font(.largeTitle)
                    }
            }
            
            Button(action: {
                self.selection = 1
            }, label: {Text("show countries")})
                .tag(1)
                .tabItem{
                    VStack{
                        Image (systemName: "map")
                        Text("Countries").font(.largeTitle)
                    }
            }
            
            AboutView().tag(2)
                .tabItem{
                    VStack{
                        Image (systemName: "exclamationmark.bubble")
                        Text("About").font(.largeTitle)
                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
