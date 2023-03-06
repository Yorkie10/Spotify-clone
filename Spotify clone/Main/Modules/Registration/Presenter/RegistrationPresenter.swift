//
//  RegistrationPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 25.01.2023.
//

import UIKit


protocol IRegistrationPresenter: AnyObject {
    
    func viewDidLoad()
    func loginTapped(at index: Int)
    func signUpTapped()
}


final class RegistrationPresenter: IRegistrationPresenter {
    
    private let wireframe: IRegistrationWireframe
    private weak var view: IRegistrationView?
    
    private var buttons: [RegistrationButtonType] = [.google, .facebook, .apple, .login]
    private var selectedButton: RegistrationButtonType?
    
    init(wireframe: IRegistrationWireframe, view: IRegistrationView) {
        self.wireframe = wireframe
        self.view = view
    }
    
    func viewDidLoad() {
       configureData()
    }
    
    func loginTapped(at index: Int) {
      selectedButton = buttons[index]
        switch selectedButton {
        default:
            print("🤪Tapped AT \(buttons[index])")
        }
    }
    
    func signUpTapped() {
        wireframe.pushToLogin()
    }
    
    private func configureData() {
        view?.configureRegistrationButtons(buttons)
    }
}
