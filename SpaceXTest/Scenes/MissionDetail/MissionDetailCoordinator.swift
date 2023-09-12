//
//  MissionDetailCoordinator.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import Foundation
import UIKit

protocol MissionDetailCoordinator: Coordinator {
    func openWebView(url: String)
    func openYouTube(id: String)
}

final class MissionDetailCoordinatorImp: MissionDetailCoordinator {
   
    let factory: MissionDetailFactory
    let navigationController: UINavigationController
    let mission: Mission
    
    init(factory: MissionDetailFactory, navigationController: UINavigationController, mission: Mission) {
        self.navigationController = navigationController
        self.factory = factory
        self.mission = mission
    }
    
    @discardableResult
    func start() -> UIViewController {
        let viewController: UIViewController = factory.createMissionDetailModule(coordinator: self, mission: mission)
        return viewController
    }
    
    func openWebView(url: String) {
        let viewController = InfoWebViewViewController(url: url)
        navigationController.present(viewController, animated: true)
    }
    
    func openYouTube(id: String) {
        let viewController = YoutubeViewController(youtubeID: id)
        navigationController.present(viewController, animated: true)
    }
}
