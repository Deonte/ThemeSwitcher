//
//  Theme.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import Foundation
import SwiftUI

enum ThemeType: String {
    case plain
    case gradient
}

struct Theme: Equatable {
    let type: ThemeType
    var color: Color?
    var colors: [Color]?
    
    init(type: ThemeType, color: Color? = nil, colors: [Color]? = nil) {
        self.type = type
        switch type {
        case .plain:
            self.color = color
        case .gradient:
            self.colors = colors
        }
    }
}

let themes = [
    Theme(type: .plain, color: .red),
    Theme(type: .plain, color: .green),
    Theme(type: .gradient, colors: [.red, .yellow]),
    Theme(type: .gradient, colors: [.orange, .green]),
    Theme(type: .plain, color: .blue)
]
