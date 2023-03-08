//
//  OnboardingPresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 25.01.2023.
//

import UIKit


protocol IOnboardingPresenter: AnyObject {
    
    func viewDidLoad()
    func loginTapped(at index: Int)
    func signUpTapped()
}


final class OnboardingPresenter: IOnboardingPresenter {
    
    private let wireframe: IOnboardingWireframe
    private weak var view: IOnboardingView?
    
    private var buttons: [OnboardingButtonType] = [.google, .facebook, .apple, .login]
    private var selectedButton: OnboardingButtonType?
    
    init(wireframe: IOnboardingWireframe, view: IOnboardingView) {
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
