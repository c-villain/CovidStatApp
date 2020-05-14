//
//  SlideData.swift
//  SwiftUI-PieChart
//
//  Created by Alexander Kraev on 07.05.2020
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import Foundation
import SwiftUI

class SlideData: Identifiable, ObservableObject {
    let id: UUID = UUID()
    var data: DataItem!
    var startAngle: Angle! = .degrees(0)
    var endAngle: Angle! = .degrees(0)
    
    var annotation: String! = ""
    var annotationDeltaX: CGFloat! = 0.0
    var annotationDeltaY: CGFloat! = 0.0
    
    var deltaX: CGFloat! = 0.0
    var deltaY: CGFloat! = 0.0
    
    init() { }
    
    init(startAngle: Angle, endAngle: Angle) {
        self.data = DataItem(name: "", value: 0)
        self.startAngle = startAngle
        self.endAngle = endAngle
    }
}
