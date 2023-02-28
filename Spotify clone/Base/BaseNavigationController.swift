//
//  BaseNavigationController.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 25.01.2023.
//

import UIKit


public final class BaseNavigationController: UINavigationController {
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        if let topVc = viewControllers.last {
            return topVc.preferredStatusBarStyle
        }
        return .default
    }
    
    public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    public override var shouldAutorotate: Bool {
        return false
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var dismissCallBack: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationCapturesStatusBarAppearance = true
        setNavigationBarHidden(true, animated: false)
        interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = viewControllers.last?.view.backgroundColor
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed {
            dismissCallBack?()
        }
    }
}


extension BaseNavigationController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
