//
//  RegistrationAssembly.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 17.02.2023.
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
            let view = RegistrationViewController()
            let presenter = r.resolve(IRegistrationPresenter.self, argument: view as IRegistrationView)!
            view.presenter = presenter
            return view
        }
    }
}
