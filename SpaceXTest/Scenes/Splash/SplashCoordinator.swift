//
//  SplashCoordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import UIKit

final class SplashCoordinator: Coordinator {
    
    var splashViewController: SplashViewController
    
    init(splashViewController: SplashViewController = SplashViewController()) {
        self.splashViewController = splashViewController
    }
    
    func start() -> UIViewController {
        return splashViewController
    }
}
