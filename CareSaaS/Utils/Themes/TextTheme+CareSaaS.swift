//
//  TextTheme+CareSaaS.swift
//  CareSaaS
//
//  Created by Obinna on 15/06/2024.
//

import SwiftUI

// MARK: - Text themes based on design

extension TextTheme {
    
    static var labelPrimary: TextTheme {
        TextTheme(font: .custom(.semiBold, size: .size16), color: Color(.labelPrimary))
    }
    
    static var labelPrimaryRoboto: TextTheme {
        TextTheme(font: .custom(.regular, size: .size13), color: Color(.labelPrimary))
    }
    
    static var backgroundRed: TextTheme {
        TextTheme(font: .custom(.regular, size: .size14), color: Color(.backgroundRed))
    }
    
    static var bodyMediumSecondaryEmphasis: TextTheme {
        TextTheme(font: .custom(.regular, size: .size16), color: Color(.bodyMediumEmphasis))
    }
    
    static var bodyMediumPrimaryEmphasis: TextTheme {
        TextTheme(font: .custom(.regular, size: .size14), color: Color(.bodyMediumEmphasis))
    }
    
    static var bodyMediumTertiaryEmphasis: TextTheme {
        TextTheme(font: .custom(.regular, size: .size13), color: Color(.bodyMediumEmphasis))
    }
    
    static var primaryDisabled: TextTheme {
        TextTheme(font: .custom(.regular, size: .size13), color: Color(.primaryDisabled))
    }
    
    static var bodyWhiteSolid: TextTheme {
        TextTheme(font: .custom(.regular, size: .size13), color: Color(.bodyWhiteSolid))
    }
    
    static var primaryHighEmphasis: TextTheme {
        TextTheme(font: .custom(.regular, size: .size13), color: Color(.primaryHighEmphasis))
    }
    
    static var primaryHighSolidEmphasis: TextTheme {
        TextTheme(font: .custom(.bold, size: .size13), color: Color(.primaryHighEmphasis))
    }
    
    static var bodyMediumSolidEmphasis: TextTheme {
        TextTheme(font: .custom(.bold, size: .size13), color: Color(.bodyMediumEmphasis))
    }
    
    static var bodyHighEmphasisSize16: TextTheme {
        TextTheme(font: .custom(.semiBold, size: .size16), color: Color(.bodyHighEmphasis))
    }
    
    static var bodyHighEmphasisRegularSize16: TextTheme {
        TextTheme(font: .custom(.semiBold, size: .size16), color: Color(.bodyHighEmphasis))
    }
    
    static var bodyHighEmphasisSize14: TextTheme {
        TextTheme(font: .custom(.bold, size: .size14), color: Color(.bodyHighEmphasis))
    }
    
    static var primaryHighEmphasisBoldSize16: TextTheme {
        TextTheme(font: .custom(.bold, size: .size16), color: Color(.primaryHighEmphasis))
    }
    
    static var primaryDisabledBoldSize16: TextTheme {
        TextTheme(font: .custom(.bold, size: .size16), color: Color(.primaryDisabled))
    }
    
    static var labelPrimaryTitle: TextTheme {
        TextTheme(font: .custom(.bold, size: .size32), color: Color(.labelPrimary))
    }
    
    static var labelPrimarySubTitle: TextTheme {
        TextTheme(font: .custom(.bold, size: .size16), color: Color(.labelPrimary))
    }
    
    static var labelPrimaryCellTitle: TextTheme {
        TextTheme(font: .custom(.bold, size: .size14), color: Color(.labelPrimary))
    }
}
