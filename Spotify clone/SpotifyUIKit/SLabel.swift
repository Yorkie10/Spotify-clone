//
//  SLabel.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 20.01.2023.
//

import UIKit


public final class SLabel: UILabel {
    
    public init(_ font: UIFont, _ textColor: UIColor, _ alignment: NSTextAlignment = .left, lines: Int = 1, text: String = "") {
        super.init(frame: .zero)
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = lines
        self.text = text
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
}
