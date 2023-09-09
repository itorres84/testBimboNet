//
//  RemoteDataIsSynProvider.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

protocol RemoteDataIsSynProvider {
    func isRemoteSyncToday() -> Bool
    func saveSyncToday()
}

final class RemoteDataIsSynProviderImp: RemoteDataIsSynProvider {
    
    let defaults = UserDefaults.standard
    
    func isRemoteSyncToday() -> Bool {
        if let date: Date = defaults.object(forKey: KeysUserDefaults.dateSync.rawValue) as? Date {
            return !Calendar.current.isDateInYesterday(date)
        }
        return false
    }
    
    func saveSyncToday() {
        defaults.set(Date(), forKey: KeysUserDefaults.dateSync.rawValue)
    }
}
