//
//  SplashFactory.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import UIKit

protocol SplashFactory {
    func createSplashModule(coordinator: SplashCoordinator) -> UIViewController
}

final class SplashFactoryImp: SplashFactory {
        
    func createSplashModule(coordinator: SplashCoordinator) -> UIViewController {
        let provider: RemoteConfigProvider = RemoteConfigProviderImp()
        let useCase: SynchronizeRemoteVariablesUseCase = SynchronizeRemoteVariablesUseCaseImp(provider: provider)
        let isRemoteDataIsSynchronizedUseCase: IsRemoteDataIsSynchronizedUseCase = IsRemoteDataIsSynchronizedUseCaseImp()
        let viewModel: SplashViewModel = SplashViewModel(synchronizeRemoteVariablesUseCase: useCase,
                                                         isRemoteDataIsSynchronizedUseCase: isRemoteDataIsSynchronizedUseCase)
        let viewController: SplashViewController = SplashViewController(viewModel: viewModel)
        viewController.coordinator = coordinator
        return viewController
    }
}
