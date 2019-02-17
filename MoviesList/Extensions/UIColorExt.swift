//
//  UIColorExt.swift
//  Monty
//
//  Created by Taimur Mushtaq on 02/02/2017.
//  Copyright © 2018 Taimur Mushtaq. All rights reserved.
//

import UIKit

extension UIColor {
    
    //MARK: - Main Colors
    static var mlNavBar: UIColor {
        return UIColor.white
    }
    static var mlAppBG: UIColor {
        return UIColor(hex: 0xF5F5F5)
    }
    
    static var mlBlack: UIColor {
        return UIColor(hex: 0x2D2D2D)
    }
    static var mlGray: UIColor {
        return UIColor(hex: 0x878787)
    }
    static var mlGrayDark: UIColor {
        return UIColor(hex: 0x5A5A5A)
    }
    static var mlBorderGray: UIColor {
        return UIColor(hex: 0xdcdcdc)
    }
    static var mlGreen: UIColor {
        return UIColor(hex: 0x169E85)
    }
    static var mlGreenDark: UIColor {
        return UIColor(hex: 0x00533D)
    }
    static var mlRed: UIColor {
        return UIColor(hex: 0xEC2727)
    }
    static var mlBlue: UIColor {
        return UIColor(hex: 0x2980B9)
    }
    static var mlPurple: UIColor {
        return UIColor(hex: 0x8E43AD)
    }
    static var mlYellowPail: UIColor {
        return UIColor(hex: 0xF29C10)
    }
    static var mlRedPail: UIColor {
        return UIColor(hex: 0x1E13625)
    }
    static var mlBadgeBlue: UIColor {
        return UIColor(hex: 0x34495E)
    }
    static var mlBadgeRed: UIColor {
        return UIColor(hex: 0xEC2727)
    }
    
    //MARK: Info Messages Color
    static var mlErrorRed: UIColor {
        return UIColor(hex: 0xa80000)
    }
    static var mlSuccessGreen: UIColor {
        return UIColor(hex: 0x00964c)
    }
    static var mlWarningGray: UIColor {
        return UIColor(hex: 0x323232)
    }
    
    
    //MARK: - Uitility Methods
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    convenience init(hex: Int, alpha: CGFloat) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)
    }
    static func colorWithHex(hex: Int) -> CGColor {
        return UIColor(hex: hex).cgColor
    }
    
    func withAlpha(_ alpha: CGFloat) -> UIColor {
        return self.withAlphaComponent(alpha)
    }
}
