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
        APIClient.missions { result in
            switch result {
            case .success(let success):
                dump(success)
                completion()
            case .failure(let failure):
                print(failure.localizedDescription)
                completion()
            }
        }
    }
}
