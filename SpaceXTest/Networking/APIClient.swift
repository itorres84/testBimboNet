//
//  APIClient.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Alamofire

class APIClient {
    static func missions(completion:@escaping (Result<[MissionResponseModel], Error>)->Void) {
        AF.request(APIRouter.missions)
            .responseDecodable { (response: DataResponse<[MissionResponseModel], AFError>) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
