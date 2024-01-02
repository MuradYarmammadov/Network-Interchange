//
//  APICaller.swift
//  Network Interchange
//
//  Created by Murad Yarmamedov on 02.01.24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidServerResponse
}

public class WebService {
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
