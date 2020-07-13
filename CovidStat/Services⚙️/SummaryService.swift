//
//  SummaryService.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit
import CoreData
import SwiftUI

class SummaryService: SummaryServiceProtocol {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // MARK: - Base operations for working with DB
    
    private func saveSummaryToCore(summary: Summary) throws -> Void {
        let summaryCore = SummaryObj(context: context)
        
        summaryCore.id = summary.id
        
//        let countriesCore = CountryObj(context: context)
//        let countriesSet = Set((summary.countries?.map(CountryObj.from(obj:)))!)
        
        let set = NSMutableSet();
        
        for country in summary.countries!{
            let countryObj = CountryObj(context: context)
            countryObj.id = country.id
            countryObj.country = country.country
            countryObj.countryCode = country.countryCode
            countryObj.slug = country.slug
            countryObj.newConfirmed = Int32(country.newConfirmed ?? 0)
            countryObj.totalConfirmed = Int32(country.totalConfirmed ?? 0)
            countryObj.newDeaths = Int32(country.newDeaths ?? 0)
            countryObj.totalDeaths = Int32(country.totalDeaths ?? 0)
            countryObj.newRecovered = Int32(country.newRecovered ?? 0)
            countryObj.totalRecovered = Int32(country.totalRecovered ?? 0)
            countryObj.date = country.date
             set.add(countryObj)
        }
        
        summaryCore.addToCountries(set)
        
//        let countriesCore = summary.countries?.map(CountryObj.init(with:))
        
//        summaryCore.countries = Set((summary.countries?.map(CountryObj.from(obj:)))!)

        let sumGlobalCore = SummaryGlobalObj(context: context)
        sumGlobalCore.id = summary.global?.id
        sumGlobalCore.newConfirmed = Int32(summary.global?.newConfirmed ?? 0)
        sumGlobalCore.totalConfirmed = Int64(summary.global?.totalConfirmed ?? 0)
        sumGlobalCore.newDeaths = Int32(summary.global?.newDeaths ?? 0)
        sumGlobalCore.totalDeaths = Int32(summary.global?.totalDeaths ?? 0)
        sumGlobalCore.newRecovered = Int32(summary.global?.newRecovered ?? 0)
        sumGlobalCore.totalRecovered = Int32(summary.global?.totalRecovered ?? 0)
        
        summaryCore.summaryGlobal = sumGlobalCore
        
        try? context.save()
    }

    
    private func deletePreviousCache(){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = SummaryObj.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        _ = try? context.execute(deleteRequest)
        
        try? context.save()
    }
    
    private func loadSummaryFromCore( onGetting: @escaping (_ results: Result<Summary?, Error>) -> ()) {
        do{
            let fetchRequest: NSFetchRequest<SummaryObj> = SummaryObj.fetchRequest()
            let summaryCore = try context.fetch(fetchRequest).first
            
            let summary = summaryCore.map(Summary.from(obj:))
            onGetting(.success(summary))
        }
        catch{
            onGetting(.failure(error))
        }
    }
    
    func loadCovidSummary(completion: @escaping (_ results: Result<Summary?, Error>) ->  Void) {
        
        SummaryOfTotalCasesAPI.getSummary(){
            response, error in
            DispatchQueue.main.async {
                guard let results = response, error == nil else {
                    if let error = error as NSError?{
                        //load from data core if some error in request:
                        self.loadSummaryFromCore(){
                            result in
                            switch result{
                            case .success(let summaryFromCore):
                                completion(.success(summaryFromCore))
                            case .failure(let errorLoadingFromDb):
                                print("Failed loading summary from core: " + errorLoadingFromDb.localizedDescription)
                                print("Failed loading summary from network: " + error.localizedDescription)
                                completion(.failure(error))
                            }
                        }
                        completion(.failure(error))
                    }
                    return
                }
                
                //save summary to core as cache:
                DispatchQueue.main.async{
                    do{
                        self.deletePreviousCache()
                        try self.saveSummaryToCore(summary: results)}
                    catch{
                        print("Failed to save summary in core: \(error)")
                    }
                }
                completion(.success(results))
            }
        }
    }
}
