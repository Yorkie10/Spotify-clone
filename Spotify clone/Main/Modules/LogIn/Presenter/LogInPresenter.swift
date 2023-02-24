//
//  LogInPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 02.02.2023.
//

import Foundation

protocol ILoginPresenter: AnyObject {
    
    func closeTapped()
}

final class LoginPresenter: ILoginPresenter {
    
    private let wireframe: ILoginWireframe
    private weak var view: ILoginView?
    
    init(wireframe: ILoginWireframe,
         view: ILoginView ) {
        self.wireframe = wireframe
        self.view = view
    }
    
    func closeTapped() {
        wireframe.closeModule()
    }
}
