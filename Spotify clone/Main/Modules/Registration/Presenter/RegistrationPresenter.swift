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
        case .login:
            wireframe.pushToLogin()
        default:
            print("🤪Tapped AT \(buttons[index])")
        }
    }
    
    private func configureData() {
        view?.configureRegistrationButtons(buttons)
    }
}
