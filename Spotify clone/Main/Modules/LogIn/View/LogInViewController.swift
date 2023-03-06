//
//  LogInViewController.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 02.02.2023.
//

import UIKit
import SnapKit
import TransitionButton

protocol ILoginView: IBaseView {
    
    var presenter: ILoginPresenter? { get set }
    
}

final class LogInViewController: BaseViewController {
    
    var presenter: ILoginPresenter?
    
    private lazy var topNavigationBar = SNavigationBar(title: "Create account", tapCallback: { [weak presenter] in
        presenter?.closeTapped()
    })
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.alwaysBounceVertical = true
        return view
    }()
    private let containerView = UIView()
    private let userNameTitle = SLabel(.systemFont(ofSize: 20, weight: .bold), .white, .left, lines: 1, text: "Enter user name")
    private let emailTitle = SLabel(.systemFont(ofSize: 20, weight: .bold), .white, .left, lines: 1, text: "Enter e-mail")
    private let passwordTitle = SLabel(.systemFont(ofSize: 20, weight: .bold), .white, .left, lines: 1, text: "Enter password")
    private let userNameTextfield: UITextField = {
        let field = UITextField()
        field.backgroundColor = .darkGrey
        field.tintColor = .accentGreen
        return field
    }()
    private let emailTextfield: UITextField = {
        let field = UITextField()
        field.backgroundColor = .darkGrey
        field.tintColor = .accentGreen
        field.keyboardType = .emailAddress
        return field
    }()
    private let passwordTextfield: UITextField = {
        let field = UITextField()
        field.backgroundColor = .darkGrey
        field.tintColor = .accentGreen
        field.isSecureTextEntry = true
        return field
    }()
    private lazy var userNameContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .darkGrey
        view.addSubview(userNameTextfield)
        userNameTextfield.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 10))
            make.height.equalTo(16)
        }
        return view
    }()
    private lazy var emailContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .darkGrey
        view.addSubview(emailTextfield)
        emailTextfield.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 10))
            make.height.equalTo(16)
        }
        return view
    }()
    private lazy var passwordContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .darkGrey
        view.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 10))
            make.height.equalTo(16)
        }
        return view
    }()
    private lazy var nextButton: TransitionButton = {
        let btn = TransitionButton()
        btn.backgroundColor = .white
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        btn.layer.cornerRadius = 21
        btn.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(topNavigationBar)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(topNavigationBar.snp.bottom)
            make.bottom.leading.trailing.equalToSuperview()
        }
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(view.snp.width)
        }
        containerView.addSubview(userNameTitle)
        userNameTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(30)
        }
        containerView.addSubview(userNameContainer)
        userNameContainer.snp.makeConstraints { make in
            make.top.equalTo(userNameTitle.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(46)
        }
        containerView.addSubview(emailTitle)
        emailTitle.snp.makeConstraints { make in
            make.top.equalTo(userNameContainer.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        containerView.addSubview(emailContainer)
        emailContainer.snp.makeConstraints { make in
            make.top.equalTo(emailTitle.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(46)
        }
        containerView.addSubview(passwordTitle)
        passwordTitle.snp.makeConstraints { make in
            make.top.equalTo(emailContainer.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
        }
        containerView.addSubview(passwordContainer)
        passwordContainer.snp.makeConstraints { make in
            make.top.equalTo(passwordTitle.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(46)
        }
        containerView.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(40)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            let textWidth = (nextButton.titleLabel?.text ?? "").width(withConstrainedHeight: 16, font: .systemFont(ofSize: 12, weight: .semibold))
            make.width.equalTo(40 + textWidth)
            make.height.equalTo(42)
        }
    }
    
    @objc private func nextButtonTapped() {
        
        guard let userName = userNameTextfield.text,
              let email = emailTextfield.text,
              let password = passwordTextfield.text else { return }
        presenter?.acceptLoginData(with: userName, address: email, and: password)
        presenter?.loginStart()
    }
}


extension LogInViewController: ILoginView {
    
}
