//
//  BaseProtocols.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 26.01.2023.
//

import UIKit


@objc public protocol IBaseView: AnyObject {
    
    @objc optional func showLoading()
    
    @objc optional func hideLoading()
    
    @objc optional func showError(message: String)
}


public protocol IBaseWireframe: AnyObject {
    
    var router: IAppRouter { get }
    var rootView: UIViewController? { get set }
    
    func showAlert(input: AlertInput)
    func showInvalidEmailAlert()
    func showInvalidPasswordAlert()
    
    func showErrorSignIn()
}
