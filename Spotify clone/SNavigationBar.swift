//
//  SNavigationBar.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 15.02.2023.
//

import SnapKit
import UIKit


public final class SNavigationBar: UIView {
    
    private let titleLabel = SLabel( .systemFont(ofSize: 17, weight: .medium), .white)
    private lazy var returnButton: TapPaddingButton = {
        let btn = TapPaddingButton(inset: 16.0)
        btn.setImage(UIImage(named: "ic_return"), for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(returnTapped), for: .touchUpInside)
        return btn
    }()
    private let tapCallback: () -> Void
    
    public var trailingConstraint: Constraint?
    
    public var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    public var font: UIFont? {
        didSet {
            titleLabel.font = font
        }
    }
    
    public var isBackButtonHidden: Bool = false {
        didSet {
            returnButton.isHidden = isBackButtonHidden
        }
    }
    
    public init(title: String, tapCallback: @escaping () -> Void) {
        self.tapCallback = tapCallback
        super.init(frame: CGRect(x: 0,
                                 y: UIView.safeTopAreaHeight,
                                 width: UIView.screenWidth,
                                 height: 36))
        titleLabel.text = title
        titleLabel.adjustsFontSizeToFitWidth = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(returnButton)
        returnButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(19)
            make.size.equalTo(24)
        }
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func returnTapped() {
        tapCallback()
    }
}
