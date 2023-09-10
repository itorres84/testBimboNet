//
//  HomeViewModel.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 08/09/23.
//

import Foundation

final class HomeViewModel {
 
    var storageMissions: [Mission] = [] {
        didSet {
            bindSynchronizeViewModelToController(storageMissions)
        }
    }
    
    var bindSynchronizeViewModelToController: ([Mission]) -> () = {_ in }
    let getMissionsFromStorageUseCase: GetMissionsFromStorageUseCase
    
    init(getMissionsFromStorageUseCase: GetMissionsFromStorageUseCase) {
        self.getMissionsFromStorageUseCase = getMissionsFromStorageUseCase
    }
    
    func fetchMisions() {
        getMissionsFromStorageUseCase.invoke { [weak self] missions in
            self?.storageMissions = missions
        }
    }
    
}
