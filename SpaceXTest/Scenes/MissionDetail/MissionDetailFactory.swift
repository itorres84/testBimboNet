//
//  MissionDetailFacotory.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 11/09/23.
//

import Foundation
import UIKit

protocol MissionDetailFactory {
    func createMissionDetailModule(coordinator: MissionDetailCoordinator, mission: Mission) -> UIViewController
}

final class MissionDetailFactoryImp: MissionDetailFactory {
    func createMissionDetailModule(coordinator: MissionDetailCoordinator, mission: Mission) -> UIViewController {
        let viewModel: MissionDetailViewModel = MissionDetailViewModel(mission: mission)
        let viewController: MissionDetailViewController = MissionDetailViewController(viewModel: viewModel)
        viewController.coordinator = coordinator
        return viewController
    }
}
