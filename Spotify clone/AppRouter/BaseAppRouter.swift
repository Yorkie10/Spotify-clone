//
//  BaseAppRouter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 25.01.2023.
//

import UIKit
import Swinject


public class BaseAppRouter: NSObject, IAppRouter, UINavigationControllerDelegate {
    
    private var assembler: Assembler!
    
    public let appDelegate = UIApplication.shared.delegate
    
    public var navigationController: UINavigationController?
    
    public init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    public var resolver: Resolver {
        return assembler.resolver
    }
    
    public func present(view: UIViewController, animatedDisplay: Bool, presentType: PresentType) {
        switch presentType {
        case .root:
            appDelegate?.window??.rootViewController = BaseNavigationController(rootViewController: view)
            navigationController = appDelegate?.window??.rootViewController as? UINavigationController
        case .push:
            navigationController?.pushViewController(view, animated: animatedDisplay)
        case .present:
            navigationController?.present(view, animated: animatedDisplay, completion: nil)
        case .presentWithNavigationBar:
            let rootView = BaseNavigationController(rootViewController: view)
            rootView.modalPresentationStyle = .fullScreen
            navigationController?.present(view, animated: animatedDisplay, completion: nil)
        case .modal:
            view.modalPresentationStyle = .overCurrentContext
            view.modalTransitionStyle = .crossDissolve
            navigationController?.present(view, animated: animatedDisplay, completion: nil)
        case .modalWithNavigationBar:
            let nav = BaseNavigationController(rootViewController: view)
            nav.modalPresentationStyle = .overCurrentContext
            nav.modalTransitionStyle = .crossDissolve
            navigationController?.present(nav, animated: animatedDisplay) {
                self.navigationController = nav
            }
        }
    }
    
    public func popToRootViewController(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    public func popViewController(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    public func dismiss() {
        if let navController = self.appDelegate?.window??.rootViewController as? UINavigationController {
            self.navigationController = navController
        }
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
