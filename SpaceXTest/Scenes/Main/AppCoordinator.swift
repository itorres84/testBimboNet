//
//  AppCoordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import UIKit

final class AppCoordinator: Coordinator {

    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() -> UIViewController {
        let splashCoordinaotor = SplashCoordinator()
        let viewController = splashCoordinaotor.start()
        window.rootViewController = viewController
        return viewController
    }
}
