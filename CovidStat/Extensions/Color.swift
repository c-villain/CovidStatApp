//
//  Color.swift
//  SwiftUI-PieChart
//
//  Created by Alexander Kraev on 07.05.2020
//  Copyright © 2020 Alexander Kraev. All rights reserved.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(red: .randomColorRGB(), green: .randomColorRGB(), blue: .randomColorRGB())
    }
}
