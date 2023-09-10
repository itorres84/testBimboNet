//
//  HomeCoordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation
import UIKit

protocol HomeCoordinator: Coordinator {
    func openDeatil(mission: Mission)
}

final class HomeCoordinatorImp: HomeCoordinator {
    
    let factory: HomeFactory
    var navigationController: UINavigationController?
    
    init(factory: HomeFactory) {
        self.factory = factory
    }
    
    func start() -> UIViewController {
        let navigationController = UINavigationController(rootViewController: factory.createHomeModule(coordinator: self))
        self.navigationController = navigationController
        navigationController.modalPresentationStyle = .currentContext
        return navigationController
    }
    
    func openDeatil(mission: Mission) {
        print("openDetail")
    }
}

