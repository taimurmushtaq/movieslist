//
//  FontName.swift
//  Taimur Mushtaq
//
//  Created by Taimur Mushtaq on 01/08/2018.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

enum FontName: String {
    case muliExtraLight = "Muli-ExtraLight"
    case muliExtraLightItalic = "Muli-ExtraLightItalic"
    case muliLight = "Muli-Light"
    case muliLightItalic = "Muli-LightItalic"
    case muli = "Muli"
    case muliItalic = "Muli-Italic"
    case muliSemiBold = "Muli-SemiBold"
    case muliSemiBoldItalic = "Muli-SemiBoldItalic"
    case muliBold = "Muli-Bold"
    case muliBoldItalic = "Muli-BoldItalic"
    case muliExtraBold = "Muli-ExtraBold"
    case muliExtraBoldItalic = "Muli-ExtraBoldItalic"
    
    func font(withSize size: CGFloat? = nil) -> UIFont {
        let s = size ?? 9
        return UIFont(name: self.rawValue, size: s) ?? UIFont.systemFont(ofSize: s)
    }
    
    func relativeFont(withSize size: CGFloat) -> UIFont {
        let s = size * Constants.wRatio
        return UIFont(name: self.rawValue, size: s) ?? UIFont.systemFont(ofSize: s)
    }
}
