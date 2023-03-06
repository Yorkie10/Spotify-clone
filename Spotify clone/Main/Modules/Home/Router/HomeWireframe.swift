//
//  HomeWireframe.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 06.03.2023.
//

import UIKit

protocol IHomeWireframe: IBaseWireframe {
    
}

final class HomeWireframe: IHomeWireframe {
    
    var router: IAppRouter { AppRouter.shared }
    weak var rootView: UIViewController?
    
    init(view: IBaseView) {
        rootView = view as? UIViewController
    }
}
