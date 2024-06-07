//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public protocol APIRequestProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var queryParams: [String: Any]? { get }
}

extension APIRequestProtocol {
    
    func makeUrlRequest() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else { fatalError("Invalid baseURL") }
                
        components.path = path
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        if let queryParams = queryParams {
            if method == .GET {
                var queryItems: [URLQueryItem] = []
                for (key, value) in queryParams {
                    let queryItem = URLQueryItem(name: key, value: String(describing: value))
                    queryItems.append(queryItem)
                }
                components.queryItems = queryItems
                request.url = components.url
            } else {
                do {
                    let data = try JSONSerialization.data(withJSONObject: queryParams)
                    request.httpBody = data
                    let dataString = String(data: request.httpBody!, encoding: .utf8)
                    print("!!! \(String(describing: dataString))")
                } catch {
                    print(error.localizedDescription)
                    
                }
                
            }
        }
        
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return request
    }
    
}

