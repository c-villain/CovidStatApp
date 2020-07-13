//
//  CasesService.swift
//  CovidStat
//
//  Created by Alexander Kraev on 12.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

class CasesService: CasesServiceProtocol{
    
    func loadAllCases(countrySlug: String, completion: @escaping (_ results: Result<[TotalCountryCases], Error>) ->  Void) {
        
        AllCasesCountryAPI.getTotalCountryCases(country: countrySlug){
            response, error in
            DispatchQueue.main.async {
                DispatchQueue.main.async {
                    guard let results = response, error == nil else {
                        if let error = error as NSError?{
                            completion(.failure(error))
                        }
                        return
                    }
                    completion(.success(results))
                }
            }
        }
    }
}
