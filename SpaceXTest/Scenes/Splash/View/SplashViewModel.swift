//
//  SplashViewModel.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation
import Combine

final class SplashViewModel {
    
    var synchronizeSuccess: Int? {
        didSet {
            bindSynchronizeViewModelToController()
        }
    }
    var bindSynchronizeViewModelToController: () -> () = {}
    private let synchronizeRemoteVariablesUseCase: SynchronizeRemoteVariablesUseCase
    
    init(synchronizeRemoteVariablesUseCase: SynchronizeRemoteVariablesUseCase) {
        self.synchronizeRemoteVariablesUseCase = synchronizeRemoteVariablesUseCase
    }
    
    func fetchSynchronize() {
        synchronizeRemoteVariablesUseCase.synchronize { [weak self] in
            self?.synchronizeSuccess = 1
        }
    }
    
}
