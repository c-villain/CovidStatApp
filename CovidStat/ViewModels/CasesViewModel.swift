//
//  CasesViewModel.swift
//  CovidStat
//
//  Created by Alexander Kraev on 12.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI
import Covid19NetworkKit

final class CasesViewModel : ObservableObject
{
    @Published private(set) var totalCases: [TotalCountryCases] = [TotalCountryCases]()
    
    @Published private(set) var newCases: [Double] = [Double]()
    
    private(set) var allCases: [TotalCountryCases] = [TotalCountryCases]()
    
    private let casesService: CasesService
    
    init(casesService: CasesService) {
        self.casesService = casesService
    }
    
    func countNewCases() -> Void{
        self.newCases.removeAll()
        guard self.totalCases.count > 1 else { return }
        
        var outputArray = [Double]()

        for index in (1 ..< self.totalCases.count) {
            guard self.totalCases.count > index,
            self.totalCases[index].confirmed != nil,
            self.totalCases[index - 1].confirmed != nil else {
                continue
            }
            outputArray.append(Double(self.totalCases[index].confirmed! - self.totalCases[index - 1].confirmed!))
        }
        DispatchQueue.main.async{
        self.newCases.append(contentsOf: outputArray)
        }
    }
    
    func clearCases() -> Void{
        self.totalCases.removeAll()
        self.allCases.removeAll()
        self.newCases.removeAll()
    }
    
    func loadAllCases(countrySlug: String) -> Void{
        casesService.loadAllCases(countrySlug: countrySlug) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let allCases):
                    self.allCases.append(contentsOf: allCases)
                    self.totalCases.append(contentsOf: self.allCases)
                    self.countNewCases()
                case .failure(let error):
                    print("Faied to load summary: " + error.localizedDescription)
                }
            }
        }
    }
    
    func notFilterCases() -> Void{
        guard self.allCases.count != 0 else {return}
        self.totalCases = self.allCases
        self.countNewCases()
    }
    
    
    func filterCasesForDays(daysCount: Double) -> Void{
        guard self.allCases.count != 0 else {return}
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let daysString = formatter.string(from: Date().addingTimeInterval(-1*daysCount*24*60*60))
        
        self.totalCases = self.allCases.filter{
            ($0.date ?? "") > daysString
        }
        self.countNewCases()
    }
    
    
    func loadCasesFor10Days(countrySlug: String) -> Void{
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let tenDaysString = formatter.string(from: Date().addingTimeInterval(-10*24*60*60))
        
        if self.totalCases.count == 0 {
            casesService.loadAllCases(countrySlug: countrySlug) { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let allCases):
                    self.totalCases.append(contentsOf: allCases.filter{
                        ($0.date ?? "") > tenDaysString
                    })
                case .failure(let error):
                    print("Faied to load summary: " + error.localizedDescription)
                    return
                }
            }}
        }
        
        self.totalCases = self.totalCases.filter{
            ($0.date ?? "") > tenDaysString
        }
    }
}

struct CasesViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
