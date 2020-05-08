//
//  SummaryService.swift
//  CovidStat
//
//  Created by Alexander Kraev on 07.05.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation

class SummaryService {
    
    func loadCovidSummary(completion: @escaping (_ results: Result<Summary?, Error>) ->  Void) {

        SummaryOfTotalCasesAPI.getSummary(){
            response, error in
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
