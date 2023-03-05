//
//  LogInPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 02.02.2023.
//

import UIKit

protocol ILoginPresenter: AnyObject {
    
    func closeTapped()
    
    func loginStart()
    
    func acceptLoginData(withEmail email: String, andPassword password: String)
    
}

final class LoginPresenter: ILoginPresenter {
    
    private let wireframe: ILoginWireframe
    private weak var view: ILoginView?
    private var loginData: LoginUserRequest!
    
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
        // email check
        if !AuthValidator.isValidEmail(for: loginData.email) {
            wireframe.showInvalidEmailAlert()
        }
        // password check
        if !AuthValidator.isPasswordValid(for: loginData.password) {
            wireframe.showInvalidPasswordAlert()
        }
        
        AuthService.shared.registerUser(with: loginData) { [weak self] wasRegistered, error in
            if let error = error {
                self?.wireframe.showAlert(input: AlertInput(message: error.message))
            }
        }
    }
}
    

