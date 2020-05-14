//
//  Double.swift
//  SwiftUI-PieChart
//
//  Created by Alexander Kraev on 07.05.2020
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation

extension Double {
    static func randomColorRGB() -> Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
}
