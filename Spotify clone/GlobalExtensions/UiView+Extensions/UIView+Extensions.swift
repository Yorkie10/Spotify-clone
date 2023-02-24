//
//  UIView+Extensions.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 20.01.2023.
//

import UIKit

public extension UIView {
    public static let screenWidth = UIScreen.main.bounds.size.width
    public static let screenHeight = UIScreen.main.bounds.size.height
    public static let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    public static var safeBottomAreaHeight: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    }
    
    public static var safeTopAreaHeight: CGFloat {
        return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
    }
    
    public var width: CGFloat {
        return safeAreaLayoutGuide.layoutFrame.width
    }
    
    public var height: CGFloat {
        return safeAreaLayoutGuide.layoutFrame.height
    }
    
}
