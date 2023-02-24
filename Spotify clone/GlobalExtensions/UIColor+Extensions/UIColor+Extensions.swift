//
//  UIColor+Extensions.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 22.02.2023.
//

import UIKit

public extension UIColor {
    static let accentGreen = UIColor(hex: 0x1ED760)
    static let darkGrey = UIColor(hex: 0x777777)
    
    
    convenience init(hex: UInt) {
        self.init(
            red: CGFloat((hex & 0xFF0000)  >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000ff) / 255.0,
            alpha: CGFloat(1.0)
            
        )
        
    }
}
