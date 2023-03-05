//
//  Errors.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 05.03.2023.
//

import UIKit

public extension Error {
    
    public var errorMessage: String? {
        return (self as? Error)?.localizedDescription
    }
    
    public var message: String {
        return errorMessage ?? "Error accured while processing"
    }
}
