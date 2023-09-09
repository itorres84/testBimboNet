//
//  SynchronizeRemoteVariablesUseCase.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

protocol SynchronizeRemoteVariablesUseCase {
    func synchronize(completion : @escaping () -> ())
}

final class SynchronizeRemoteVariablesUseCaseImp: SynchronizeRemoteVariablesUseCase {
    
    let provider: RemoteConfigProvider
    let storageProvider: RemoteDataIsSynProvider
    
    init(provider: RemoteConfigProvider, storageProvider: RemoteDataIsSynProvider) {
        self.provider = provider
        self.storageProvider = storageProvider
    }
    
    func synchronize(completion: @escaping () -> ()) {
        provider.fetch { [weak self] in
            self?.storageProvider.saveSyncToday()
            completion()
        }
    }
}

