//
//  LoginAssembly.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 17.02.2023.
//

import UIKit
import Swinject


final class LoginAssembly: Assembly {
    
    init() { }
    
    func assemble(container: Container) {
        container.register(ILoginWireframe.self) { (_, view: IBaseView) -> ILoginWireframe in
            LoginWireframe(view: view)
        }
        
        container.register(ILoginPresenter.self) { (r, view: ILoginView) in
            let wireframe = r.resolve(ILoginWireframe.self, argument: view as IBaseView)!
            let presenter = LoginPresenter(wireframe: wireframe, view: view)
            return presenter
        }
        
        container.register(ILoginView.self) { (r) -> ILoginView in
            let view = LogInViewController()
            let presenter = r.resolve(ILoginPresenter.self, argument: view as ILoginView)!
            view.presenter = presenter
            return view
        }
    }
}
