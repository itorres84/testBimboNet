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
    
    init(provider: RemoteConfigProvider) {
        self.provider = provider
    }
    
    func synchronize(completion: @escaping () -> ()) {
        self.provider.fetch(completion: completion)
    }
}

