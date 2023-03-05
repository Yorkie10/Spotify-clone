//
//  IndicatorButton.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 20.02.2023.
//

import UIKit
import SnapKit


public final class IndicatorButton: UIButton {
    
   public var dumpable: Bool = true
    
    public init(_ title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = .accentGreen
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        clipsToBounds = true
        
        layer.cornerRadius = 22
    }
    
   public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dumpable {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: .allowUserInteraction,animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }, completion: nil)
        }
        super.touchesBegan(touches, with: event)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dumpable {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)

        }
        super.touchesEnded(touches, with: event)
    }
}
