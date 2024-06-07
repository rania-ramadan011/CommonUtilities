//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation
import Combine

public class APIRequestProvider:  APIRequestProviderProtocol {
    
    
    private let internetManager: InternetManagerProtocol
    
    public init(internetManager: InternetManagerProtocol) {
        self.internetManager = internetManager
    }
    

    public func handle(apiRequest: APIRequestProtocol) -> AnyPublisher<Data, Error> {
        guard internetManager.isInternetConnectionAvailable() else {
            return Fail(error: NetworkError.noInternet)
                .eraseToAnyPublisher()
        }
        
         let request = apiRequest.makeUrlRequest()
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw NetworkError.invalidResponse
                }
//                print(response)
                let dataString = String(data: data, encoding: .utf8)
                print(dataString)
                return data
            }
            .mapError { error -> Error in
                NetworkError.requestFailed
            }
            .eraseToAnyPublisher()
    }
 
}
