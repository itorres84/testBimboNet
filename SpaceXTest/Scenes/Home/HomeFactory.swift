//
//  HomeFactory.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation
import UIKit

protocol HomeFactory {
    func createHomeModule(coordinator: HomeCoordinator) -> UIViewController
}

final class HomeFactoryImp: HomeFactory {
    func createHomeModule(coordinator: HomeCoordinator) -> UIViewController {
        let getMissionsFromStorageUseCase: GetMissionsFromStorageUseCase = GetMissionsFromStorageUseCaseImp()
        let homeViewModel: HomeViewModel = HomeViewModel(getMissionsFromStorageUseCase: getMissionsFromStorageUseCase)
        let homeViewController: HomeViewController = HomeViewController(viewModel: homeViewModel)
        homeViewController.coordinator = coordinator
        return homeViewController
    }
}

