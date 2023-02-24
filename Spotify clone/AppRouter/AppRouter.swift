//
//  AppRouter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 25.01.2023.
//

import UIKit
import Swinject


public enum PresentType {
    case root, push, present, presentWithNavigationBar, modal, modalWithNavigationBar
}


public protocol IAppRouter {
    
    var resolver: Resolver { get }
    
    func present(view: UIViewController, animatedDisplay: Bool, presentType: PresentType)
    func popToRootViewController(animated: Bool)
    func popViewController(animated: Bool)
    func dismiss()
}


public class AppRouter: BaseAppRouter {
    
    public static let shared = AppRouter.createAppRouter()
    public static var assembler = Assembler()
    
    
    private static func createAppRouter() -> AppRouter {
        let router = AppRouter(assembler: assembler)
        return router
    }
}
