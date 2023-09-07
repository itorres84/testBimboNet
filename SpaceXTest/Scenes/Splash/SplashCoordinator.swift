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
    
    init(factory: SplashFactory = SplashFactoryImp()) {
        self.factory = factory
    }
    

    func start() -> UIViewController {
        return factory.createSplashModule(coordinator: self)
    }
    
    func goToLogin() {
        print("show login Screen")
    }
}
