//
//  HomeAssembly.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 06.03.2023.
//

import UIKit
import Swinject


final class HomeAssembly: Assembly {
    
    init() { }
    
    func assemble(container: Container) {
        container.register(IHomeWireframe.self) { (_, view: IBaseView) -> IHomeWireframe in
            HomeWireframe(view: view)
        }
        
        container.register(IHomePresenter.self) { (r, view: IHomeView) in
            let wireframe = r.resolve(IHomeWireframe.self, argument: view as IBaseView)!
            let presenter = HomePresenter(wireframe: wireframe, view: view)
            return presenter
        }
        
        container.register(IHomeView.self) { (r) -> IHomeView in
            let view = HomeViewController()
            let presenter = r.resolve(IHomePresenter.self, argument: view as IHomeView)!
            view.presenter = presenter
            return view

        }
    }
}
