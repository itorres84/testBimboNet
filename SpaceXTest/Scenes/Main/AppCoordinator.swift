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
        let splashCoordinator: SplashCoordinator = SplashCoordinatorImp()
        let viewController = splashCoordinator.start()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        window.overrideUserInterfaceStyle = .light
        return viewController
    }
}
