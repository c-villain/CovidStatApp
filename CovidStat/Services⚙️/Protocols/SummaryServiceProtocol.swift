//
//  SummaryServiceProtocol.swift
//  CovidStat
//
//  Created by Alexander Kraev on 13.07.2020.
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import Covid19NetworkKit

protocol SummaryServiceProtocol {
    func loadCovidSummary(completion: @escaping (_ results: Result<Summary?, Error>) ->  Void)
}
