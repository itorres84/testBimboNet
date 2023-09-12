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
        guard let navigationController = navigationController else {
            return
        }
        let factory: MissionDetailFactory = MissionDetailFactoryImp()
        let missionDetailCoordinator: MissionDetailCoordinatorImp = MissionDetailCoordinatorImp(factory: factory,
                                                                                                navigationController: navigationController,
                                                                                                mission: mission)
        let viewController: UIViewController = missionDetailCoordinator.start()
        DispatchQueue.main.async { [weak self] in
            self?.navigationController?.pushViewController(viewController, animated: false)
        }
    }
}

