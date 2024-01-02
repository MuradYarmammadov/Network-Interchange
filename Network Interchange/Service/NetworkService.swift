//
//  NetworkService.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

enum NetworkServiceType: String {
    case LocalService
    case WebService
}

protocol NetworkService {
    var type : NetworkServiceType { get }
    
    func download(_ resource: String) async throws -> [User]
}
