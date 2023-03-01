//
//  IBaseWireframe+Extensions.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 28.02.2023.
//

import UIKit


public extension IBaseWireframe {
    
    func showAlert(input: AlertInput) {
        let alert = UIAlertController(title: input.title,
                                      message: input.message,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: input.cancelButtonTitle, style: .cancel, handler: { _ in
            input.cancelButtonCallback?()
        })
        alert.addAction(cancelAction)
        
        if input.actionButtonCallback != nil {
            let exitAction = UIAlertAction(title: input.actionButtonTitle, style: .default) { _ in
                input.actionButtonCallback?()
            }
            cancelAction.setValue(UIColor.black, forKey: "titleTextColor")
            exitAction.setValue(UIColor.accentGreen, forKey: "titleTextColor")
            alert.addAction(exitAction)
        } else {
            cancelAction.setValue(UIColor.accentGreen, forKey: "titleTextColor")
        }
        rootView?.present(alert, animated: true, completion: nil)
    }
    
    func showInvalidEmailAlert() {
       showAlert(input: AlertInput(title: "Invalid email",message: "Please enter a valid email"))
    }
    
    func showInvalidPasswordAlert() {
        showAlert(input: AlertInput(title: "Invalid password", message: "Please enter a valid password"))
    }
}
