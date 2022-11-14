//
//  Theme.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import Foundation
import SwiftUI

enum ThemeType: String, Equatable {
    case plain = "plain"
    case gradient = "gradient"
}

enum ColorNames: String, Equatable {
   case blue
   case green
   case red
   case yellow
   case orange
   case cyan
}

struct Theme: Equatable {
    let type: String
    var color: ColorNames?
    var colors: [ColorNames]?
    
    init(type: ThemeType, color: ColorNames? = nil, colors: [ColorNames]? = nil) {
        self.type = type.rawValue
        switch type {
        case .plain:
            self.color = color
        case .gradient:
            self.colors = colors
        }
    }
}

