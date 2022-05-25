//
//  ColorData.swift
//  bucketlist
//
//  Created by 노규명 on 2022/05/18.
//

import SwiftUI

final class ColorData: ObservableObject {
    @Published var primary: ColorPalette = .red
    @Published var secondary: ColorPalette = .white
    @Published var tertiary: ColorPalette = .black
    
    init() {
        guard let primaryColor = UserDefaults.standard.object(forKey: "primaryColor") as? String else { return }
        let color = ColorPalette(rawValue: primaryColor)!
        self.primary = color
    }
    
    func changePrimaryColor(_ color: ColorPalette) {
        self.primary = color
        UserDefaults.standard.set(color.rawValue, forKey: "primaryColor")
    }
}
