//
//  BaseViewController.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 20.01.2023.
//

import UIKit


open class BaseViewController: UIViewController {
    
    private var isParent: Bool {
        if parent == nil || parent is UINavigationController || parent is UITabBarController {
            return true
        }
        return false
    }
    
    open override var shouldAutorotate: Bool {
        return false
    }
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    open override func viewDidLoad() {
        setupViews()
    }
    
    open func setupViews() {
        
    }
}
