//
//  NetworkConstants.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

struct NetworkConstants {
    
    static let shared = NetworkConstants()
    
    private init() {}
    
    struct Urls {
        static let baseURL = "https://jsonplaceholder.typicode.com"
        static let usersExtension = "\(baseURL)/users"
    }
}
