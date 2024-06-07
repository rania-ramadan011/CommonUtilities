//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation

public enum NetworkError: Error {
    case requestFailed //(description: String)
    case invalidData
    case invalidUrl
    case invalidResponse //(description: String)
    case jsonConversionFailure //(description: String)
    case jsonParsingFailure
    case failedSerialization
    case noInternet
    case decodingError
}

extension NetworkError {
    public var errorDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed: \(self.localizedDescription)"
        case .invalidData:
            return "Invalid Data: \(self.localizedDescription)"
        case .invalidUrl:
            return "Invalid Url: \(self.localizedDescription)"
        case .invalidResponse:
            return "Invalid Response: \(self.localizedDescription)"
        case .jsonConversionFailure:
            return "JSON Conversion Failur: \(self.localizedDescription)"
        case .jsonParsingFailure:
            return "JSON Parsing Failure"
        case .failedSerialization:
            return "Serialization failed."
        case .noInternet:
            return "No internet connection: \(self.localizedDescription)"
        case .decodingError:
            return "Decoding failed."

        }
    }
}
