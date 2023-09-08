//
//  IsRemoteDataIsSynchronizedUseCase.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

protocol IsRemoteDataIsSynchronizedUseCase {
    func execute() -> Bool
}

final class IsRemoteDataIsSynchronizedUseCaseImp: IsRemoteDataIsSynchronizedUseCase {
    
    let provider: RemoteDataIsSynProvider
    
    init(provider: RemoteDataIsSynProvider = RemoteDataIsSynProviderImp()) {
        self.provider = provider
    }
    
    func execute() -> Bool {
        provider.isRemoteSyncToday()
    }
}
