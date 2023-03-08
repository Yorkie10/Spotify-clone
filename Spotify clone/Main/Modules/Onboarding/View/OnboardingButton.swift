//
//  OnboardingButton.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 24.01.2023.
//

import UIKit
import SnapKit


final class OnboardingButton: UIButton {
    
    var dumpable: Bool = true
    
    init(title: String?, icon: UIImage? = nil) {
        super.init(frame: .zero)
        backgroundColor = .black
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        setImage(icon, for: .normal)
        
        adjustsImageWhenHighlighted = false
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        if icon != nil {
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
            layer.cornerRadius = 25
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
          
        }
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dumpable {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: .allowUserInteraction,animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }, completion: nil)
            titleLabel?.alpha = 0.5
            layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        }
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dumpable {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            titleLabel?.alpha = 1.0
            layer.borderColor = UIColor.white.withAlphaComponent(1.0).cgColor
        }
        super.touchesEnded(touches, with: event)
    }
}
