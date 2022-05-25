//
//  ColorPallete.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/19.
//

import Foundation
import SwiftUI

enum ColorPalette: String {
    case red = "red"
    case blue = "blue"
    case yellow = "yellow"
    case white = "white"
    case black = "black"
    
    var colorName: String {
        switch self {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        case .yellow:
            return "Yellow"
        case .white:
            return "White"
        case .black:
            return "Black"
        }
    }
    
    var rgbColor: Color {
        switch self {
        case .red:
            return Color(red: 233/255, green: 80/255, blue: 77/255).opacity(91/100)
        case .blue:
            return Color(red: 83/255, green: 87/255, blue: 219/255).opacity(86/100)
        case .yellow:
            return Color(red: 219/255, green: 197/255, blue: 83/255).opacity(86/100)
        case .white:
            return Color.white
        case .black:
            return Color.black
        }
    }
}
