//
//  RegistrationPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 02.02.2023.
//

import UIKit

protocol IRegistrationPresenter: AnyObject {
    
    func closeTapped()
    
    func loginStart()
    
    func acceptLoginData(with userName: String, address email: String, and password: String)
    
}

final class RegistrationPresenter: IRegistrationPresenter {
    
    private let wireframe: IRegistrationWireframe
    private weak var view: IRegistrationView?
    private var loginData: RegistrationUserRequest!
    
    init(wireframe: IRegistrationWireframe,
         view: IRegistrationView ) {
        self.wireframe = wireframe
        self.view = view
    }
    
    func closeTapped() {
        wireframe.closeModule()
    }
    
    func acceptLoginData(with userName: String, address email: String, and password: String) {
        loginData = RegistrationUserRequest(userName: userName, email: email, password: password)
    }
        
    
    func loginStart() {
        // email check
        if !AuthValidator.isValidEmail(for: loginData.email) {
            wireframe.showInvalidEmailAlert()
        }
        // password check
        if !AuthValidator.isPasswordValid(for: loginData.password) {
            wireframe.showInvalidPasswordAlert()
            return
        }
        
        AuthService.shared.registerUser(with: loginData) { [weak self] wasRegistered, error in
            if let error = error {
                self?.wireframe.showAlert(input: AlertInput(message: error.message))
                return
            }
            
            if wasRegistered {
                self?.wireframe.presentHomeModule()
            } else {
                self?.wireframe.showErrorSignIn()
            }
        }

    }
}
    

