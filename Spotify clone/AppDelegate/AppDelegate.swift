//
//  AppDelegate.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 19.01.2023.
//

import UIKit
import Swinject
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppRouter.assembler.apply(assemblies: assemblies(AssemblyStorage.assemblies))
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        
//        let userRequest = LoginUserRequest(email: "Nunez@gmail.com", password: "qwertty123")
//        AuthService.shared.registerUser(with: userRequest) { wasRegistered, error in
//            if let error = error {
//                print("😍, \(error)")
//            }
//        }
        print("🌏", Auth.auth().currentUser?.email)
        
//        let view = AppRouter.shared.resolver.resolve(IRegistrationView.self) as! UIViewController
//        AppRouter.shared.present(view: view, animatedDisplay: true, presentType: .root)

        let view = AppRouter.shared.resolver.resolve(ILoginView.self) as! UIViewController
        AppRouter.shared.present(view: view, animatedDisplay: true, presentType: .root)
        
        if Auth.auth().currentUser == nil {
            let view = AppRouter.shared.resolver.resolve(IRegistrationView.self) as! UIViewController
            AppRouter.shared.present(view: view, animatedDisplay: true, presentType: .root)
        } else {
            let view = AppRouter.shared.resolver.resolve(ILoginView.self) as! UIViewController
            AppRouter.shared.present(view: view, animatedDisplay: true, presentType: .root)
        }

        return true
    }
    
    private func assemblies(_ assemblies: [Assembly]...) -> [Assembly] {
        var arr: [Assembly] = []
        assemblies.forEach {
            arr.append(contentsOf: $0)
        }
        return arr
    }
}

