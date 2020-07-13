//
//  CasesServiceProtocol.swift
//  CovidStat
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

protocol CasesServiceProtocol {
    func loadAllCases(countrySlug: String, completion: @escaping (_ results: Result<[TotalCountryCases], Error>) ->  Void)
}
