//
//  Theme.swift
//  ThemeSwitcher
//
//  Created by Deonte Kilgore on 11/12/22.
//

import Foundation
import SwiftUI

enum ThemeType: String, Equatable, Codable {
    case plain
    case gradient
    case image
}

enum ColorName: String, Equatable, Codable {
    case blue
    case green
    case red
    case yellow
    case orange
    case cyan
    case pink
}

enum ImageName: String, Codable {
    case mountain
    case water
    case forest
}

struct Theme: Equatable, Codable {
    let type: ThemeType
    var color: ColorName?
    var colors: [ColorName]?
    var image: ImageName?
    
    init(type: ThemeType, color: ColorName? = nil, colors: [ColorName]? = nil, image: ImageName? = nil) {
        self.type = type
        switch type {
        case .plain:
            self.color = color
        case .gradient:
            self.colors = colors
        case .image:
            self.image = image
        }
    }
}

