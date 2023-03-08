//
//  RegistrationWireframe.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 17.02.2023.
//

import UIKit

protocol IRegistrationWireframe: IBaseWireframe {
    func closeModule()
    func presentHomeModule()
}

final class RegistrationWireframe: IRegistrationWireframe {
 
    var router: IAppRouter { AppRouter.shared }
    weak var rootView: UIViewController?
    
    init(view: IBaseView) {
        rootView = view as? UIViewController
    }
    
    func closeModule() {
        rootView?.closeViewController(animated: true)
    }
    
    func presentHomeModule() {
        guard let view = router.resolver.resolve(IHomeView.self) as? UIViewController else { return }
        router.present(view: view, animatedDisplay: true, presentType: .present)
    }
    
}
