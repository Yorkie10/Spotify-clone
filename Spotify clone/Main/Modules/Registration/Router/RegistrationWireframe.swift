//
//  RegistrationWireframe.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 26.01.2023.
//

import UIKit

protocol IRegistrationWireframe: IBaseWireframe {
    
    func pushToLogin()
}


final class RegistrationWireframe: IRegistrationWireframe {
    
    var router: IAppRouter { AppRouter.shared }
    weak var rootView: UIViewController?
    
    init(view: IBaseView) {
        rootView = view as? UIViewController
    }
    
    func pushToLogin() {
        guard let view = router.resolver.resolve(ILoginView.self) as? UIViewController else { return }
        router.present(view: view, animatedDisplay: true, presentType: .push)
    }
}
