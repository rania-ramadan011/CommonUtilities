//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation
import Combine

public protocol NetworkManagerProtocol: AnyObject {
    
    func perform<T: Codable>(apiRequest: APIRequestProtocol, providerType: APIRequestProviderProtocol, outputType: T.Type) -> AnyPublisher<T, Error>
}
