//
//  File.swift
//  
//
//  Created by Shaimaa Mohammed on 06/06/2024.
//

import Foundation
open class BaseAPIRequest: APIRequestProtocol {
    
    open var header: [String : String]?
    open var baseURL: String
    open var path: String
    open var method: HTTPMethod
    open var queryParams: [String : Any]?

    
    public init(){
        baseURL = ""
        path = ""
        method = .GET
        header = ["Content-Type": "application/json; charset=UTF-8"]

    }
    
    
}
