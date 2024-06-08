//
//  File 2.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation
import Combine

public class APIManager: NetworkManagerProtocol {
    
    public static let shared = APIManager()
        
    private init() {}
    
    

    public func perform<T: Codable>(apiRequest: APIRequestProtocol, providerType: APIRequestProviderProtocol, outputType: T.Type) -> AnyPublisher<T, Error> {
        return call(providerType: providerType, outputType: T.self, apiRequest: apiRequest)
            .eraseToAnyPublisher()
    }

    private func call<T: Codable>(providerType: APIRequestProviderProtocol, outputType: T.Type, apiRequest: APIRequestProtocol) -> AnyPublisher<T, Error> {
        
        providerType.handle(apiRequest: apiRequest)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
