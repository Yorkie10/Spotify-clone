//
//  HomePresenter.swift
//  Spotify clone
//
//  Created by Yerkebulan Sharipov on 06.03.2023.
//

import UIKit

protocol IHomePresenter: AnyObject {
    
}

final class HomePresenter: IHomePresenter {
    
    private let wireframe: IHomeWireframe
    private weak var view: IHomeView?
    
    init(wireframe: IHomeWireframe,
         view: IHomeView) {
        self.view = view
        self.wireframe = wireframe
    }
}
