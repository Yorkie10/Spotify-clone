//
//  HomeViewController.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 06.03.2023.
//

import UIKit
import SnapKit

protocol IHomeView: IBaseView {
    var presenter: IHomePresenter? { get set }
}

final class HomeViewController: BaseViewController {
    
    var presenter: IHomePresenter?
    
    override func setupViews() {
        view.backgroundColor = .yellow
    }
}


extension HomeViewController: IHomeView {
    
}
