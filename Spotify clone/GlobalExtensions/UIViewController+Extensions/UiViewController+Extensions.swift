//
//  UiViewController+Extensions.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 21.02.2023.
//

import UIKit


public extension UIViewController {
    public func closeViewController(animated: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = navigationController {
            closeNavigation(navigationController: navigationController, animated: animated, completion: completion)
        } else {
            if presentingViewController != nil {
                dismiss(animated: animated, completion: completion)
            } else {
                completion?()
            }
        }
    }
    private func closeNavigation(navigationController: UINavigationController, animated: Bool, completion: (() -> Void)?) {
        if navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                completion?()
            }
        } else if let tabBarController = navigationController.tabBarController, let tabBarNavigationController = tabBarController.navigationController {
            closeNavigation(navigationController: tabBarNavigationController, animated: animated, completion: completion)
        } else {
            if navigationController.presentingViewController != nil {
                navigationController.dismiss(animated: animated, completion: completion)
            } else {
                completion?()
            }
        }
        
    }
}
