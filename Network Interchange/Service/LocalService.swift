//
//  LocalService.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

class LocalServive: NetworkService {
    
    var type: NetworkServiceType = .LocalService
    
    func download(_ resource: String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resouce not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
