//
//  RegistrationViewController.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 19.01.2023.
//

import UIKit
import SnapKit

protocol IRegistrationView: IBaseView {
    var presenter: IRegistrationPresenter? { get set }
    
    func configureRegistrationButtons(_ buttons: [RegistrationButtonType])
}


final class RegistrationViewController: BaseViewController {
    
    var presenter: IRegistrationPresenter?
    
    private let mainLogoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "onboarding_logo")
        return view
    }()
    private let mainLabel = SLabel(.systemFont(ofSize: 26, weight: .bold), .white, .center, lines: 0, text: "Millions of Songs. Free on Spotify ")
    private lazy var signUpButton: IndicatorButton = {
        let button = IndicatorButton("Sign up free")
        button.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        return button
    }()
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubview(signUpButton)
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func setupViews() {
        view.backgroundColor = .black
        view.addSubview(mainLogoView)
        mainLogoView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
        }
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLogoView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(90)
        }
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(22)
            make.leading.trailing.equalToSuperview().inset(45)
        }
    }
    
    @objc private func logInTapped(_ sender: UIButton) {
        presenter?.loginTapped(at: sender.tag)
    }
    
    @objc private func signUpTapped() {
        presenter?.signUpTapped()
    }
}


extension RegistrationViewController: IRegistrationView {
    
    func configureRegistrationButtons(_ buttons: [RegistrationButtonType]) {
        buttons.enumerated().forEach { tag, button in
            let button = RegistrationButton(title: button.title, icon: button.icon)
            button.tag = tag
            button.addTarget(self, action: #selector(logInTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
}

