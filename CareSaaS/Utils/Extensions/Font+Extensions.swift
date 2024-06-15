//
//  Font+Extensions.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

extension Font {
    static func custom(_ name: Roboto, size: FontSize) -> Font {
        Font.custom(name.rawValue, size: size.rawValue)
    }
    
    static func custom(_ name: Nunito, size: FontSize) -> Font {
        Font.custom(name.rawValue, size: size.rawValue)
    }
}
