//
//  TapPaddingButton.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 15.02.2023.
//

import UIKit


public class TapPaddingButton: UIButton {
    
    private let insets: UIEdgeInsets
    
    public  init(insets: UIEdgeInsets) {
        self.insets = insets
        super.init(frame: .zero)
    }
    
    public init(inset: CGFloat) {
        self.insets = UIEdgeInsets(top: -inset, left: -inset, bottom: -inset, right: -inset)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return bounds.inset(by: insets).contains(point)
    }
}
