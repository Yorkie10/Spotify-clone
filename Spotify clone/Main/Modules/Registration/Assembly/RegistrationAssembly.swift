//
//  RegistrationAssembly.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 26.01.2023.
//

import UIKit
import Swinject


final class RegistrationAssembly: Assembly {
    
    init() { }
    
    func assemble(container: Container) {
        container.register(IRegistrationWireframe.self) { (_, view: IBaseView) -> IRegistrationWireframe in
            RegistrationWireframe(view: view)
        }
        
        container.register(IRegistrationPresenter.self) { (r, view: IRegistrationView) in
            let wireframe = r.resolve(IRegistrationWireframe.self, argument: view as IBaseView)!
            let presenter = RegistrationPresenter(wireframe: wireframe, view: view)
            return presenter
        }
        
        container.register(IRegistrationView.self) { (r) -> IRegistrationView in
            let view: IRegistrationView = RegistrationViewController()
            let presenter = r.resolve(IRegistrationPresenter.self, argument: view)
            view.presenter = presenter
            return view
        }
    }
}
