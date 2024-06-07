//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation
import Combine

public protocol APIRequestProviderProtocol {
    func handle(apiRequest: APIRequestProtocol) -> AnyPublisher<Data, Error>
}
