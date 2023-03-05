//
//  AlertInput.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 28.02.2023.
//

import UIKit


public struct AlertInput {
    public var title: String?
    public var message: String?
    
    public var cancelButtonTitle: String = "Cancel"
    public var cancelButtonCallback: (() -> Void)?
    
    public var actionButtonTitle: String?
    public var actionButtonCallback: (() -> Void)?
    
    public init(title: String? = "Error", message: String?, cancelButtonTitle: String = "Cancel", cancelButtonCallback: (() -> Void)? = nil, actionButtonTitle: String? = nil, actionButtonCallback: (() -> Void)? = nil) {
        self.title = title
        self.message = message
        self.cancelButtonTitle = cancelButtonTitle
        self.cancelButtonCallback = cancelButtonCallback
        self.actionButtonTitle = actionButtonTitle
        self.actionButtonCallback = actionButtonCallback
    }
}
