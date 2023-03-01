//
//  LoginWireframe.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 17.02.2023.
//

import UIKit

protocol ILoginWireframe: IBaseWireframe {
    func closeModule()
}

final class LoginWireframe: ILoginWireframe {
 
    var router: IAppRouter { AppRouter.shared }
    weak var rootView: UIViewController?
    
    init(view: IBaseView) {
        rootView = view as? UIViewController
    }
    
    func closeModule() {
        rootView?.closeViewController(animated: true)
    }
}
