//
//  GetMissionFromStorageUseCase.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation

protocol GetMissionsFromStorageUseCase {
    func invoke(completion: @escaping ([Mission]) -> ())
}

final class GetMissionsFromStorageUseCaseImp {
    
    let provider: StorageMissionsProvider
    
    init(provider: StorageMissionsProvider = StorageMissionsProviderImp()) {
        self.provider = provider
    }
}

extension GetMissionsFromStorageUseCaseImp: GetMissionsFromStorageUseCase {
    func invoke(completion: @escaping ([Mission]) -> ()) {
        return provider.invoke(completion: completion)
    }
}

