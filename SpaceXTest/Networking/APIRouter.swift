//
//  APIRouter.swift
//  SpaceXTest
//
//  Created by Ingeniosi on 07/09/23.
//

import Alamofire
import Foundation


enum APIRouter: URLRequestConvertible {
    
    case missions
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .missions:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .missions:
            return "/launches/past"

        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .missions:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
 
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
