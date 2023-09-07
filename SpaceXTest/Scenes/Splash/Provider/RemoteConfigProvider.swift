//
//  RemoteConfigProvider.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Foundation

protocol RemoteConfigProvider {
    func fetch(completion : @escaping () -> ())
}

final class RemoteConfigProviderImp: RemoteConfigProvider {
    func fetch(completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            return completion()
        }
    }
}
