//
//  OnboardingAssembly.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 26.01.2023.
//

import UIKit
import Swinject


final class OnboardingAssembly: Assembly {
    
    init() { }
    
    func assemble(container: Container) {
        container.register(IOnboardingWireframe.self) { (_, view: IBaseView) -> IOnboardingWireframe in
            OnboardingWireframe(view: view)
        }
        
        container.register(IOnboardingPresenter.self) { (r, view: IOnboardingView) in
            let wireframe = r.resolve(IOnboardingWireframe.self, argument: view as IBaseView)!
            let presenter = OnboardingPresenter(wireframe: wireframe, view: view)
            return presenter
        }
        
        container.register(IOnboardingView.self) { (r) -> IOnboardingView in
            let view: IOnboardingView = OnboardingViewController()
            let presenter = r.resolve(IOnboardingPresenter.self, argument: view)
            view.presenter = presenter
            return view
        }
    }
}
