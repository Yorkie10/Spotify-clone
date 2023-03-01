//
//  LogInPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 02.02.2023.
//

import Foundation

protocol ILoginPresenter: AnyObject {
    
    func closeTapped()
    
    func loginStart()
    
    
    func acceptLoginData(withEmail email: String, andPassword password: String)
    
}

final class LoginPresenter: ILoginPresenter {
    
    
    private var loginData: LoginUserRequest!
    
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
    
    func acceptLoginData(withEmail email: String, andPassword password: String) {
        loginData = LoginUserRequest(email: email, password: password)
    }
    
    
    func loginStart() {
        if !AuthValidator.isValidEmail(for: loginData.email) {
            wireframe.showInvalidEmailAlert()
        }
        
        if !AuthValidator.isPasswordValid(for: loginData.password) {
            wireframe.showInvalidPasswordAlert()
        }
    }
    
}
    

