//
//  SplashCoordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import UIKit

protocol SplashCoordinator: Coordinator {
    func goToLogin()
}

final class SplashCoordinatorImp: SplashCoordinator {
    
    let factory: SplashFactory
    var viewController: UIViewController?
    
    init(factory: SplashFactory = SplashFactoryImp()) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        viewController = factory.createSplashModule(coordinator: self)
        guard let splashViewController: UIViewController = viewController else {
            fatalError("instance splash no exist")
        }
        return splashViewController
    }
    
    func goToLogin() {
        let homeCoordinator: HomeCoordinatorImp = HomeCoordinatorImp(factory: HomeFactoryImp())
        viewController?.present(homeCoordinator.start(), animated: true)
    }
}
