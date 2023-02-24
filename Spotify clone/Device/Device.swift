//
//  Device.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 20.01.2023.
//

import UIKit


public struct Device {
    
    public static var isSmall: Bool {
        return UIView.screenWidth < 375
    }
}
