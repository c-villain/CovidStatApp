//
//  DataItem.swift
//  SwiftUI-PieChart
//
//  Created by Alexander Kraev on 07.05.2020
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI

class DataItem {
    var name: String! = ""
    var value: Double = 0.0
    var color: Color! = .blue
    var highlighted: Bool = false
    
    init(name: String, value: Double, color: Color? = nil) {
        self.name = name
        self.value = value
        if let color = color {
            self.color = color
        } else {
            self.color = .random()
        }
    }
}
