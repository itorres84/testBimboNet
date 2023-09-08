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
    private let isRemoteDataIsSynchronizedUseCase: IsRemoteDataIsSynchronizedUseCase
    
    init(synchronizeRemoteVariablesUseCase: SynchronizeRemoteVariablesUseCase,
         isRemoteDataIsSynchronizedUseCase: IsRemoteDataIsSynchronizedUseCase) {
        self.synchronizeRemoteVariablesUseCase = synchronizeRemoteVariablesUseCase
        self.isRemoteDataIsSynchronizedUseCase = isRemoteDataIsSynchronizedUseCase
    }
    
    func fetchSynchronize() {
        
        if isRemoteDataIsSynchronizedUseCase.execute() {
            
        } else {
            synchronizeRemoteVariablesUseCase.synchronize { [weak self] in
                self?.synchronizeSuccess = 1
            }
        }
    }
}
