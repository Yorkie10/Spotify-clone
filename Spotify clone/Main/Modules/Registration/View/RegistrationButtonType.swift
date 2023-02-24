//
//  RegistrationButtonType.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 24.01.2023.
//

import UIKit


enum RegistrationButtonType {
    
    case google
    case facebook
    case apple
    case login
    
    var icon: UIImage? {
        switch self {
        case .google:     return UIImage(named: "icon_google")
        case .facebook:   return UIImage(named: "icon_facebook")
        case .apple:      return UIImage(named: "icon_apple")
        case .login:      return nil
    
        }
    }
    
    var title: String? {
        switch self {
        case .google:     return "Continue with Google"
        case .facebook:   return "Continue with Facebook"
        case .apple:      return "Continue with Apple"
        case .login:      return "Log in"
        }
    }
}
