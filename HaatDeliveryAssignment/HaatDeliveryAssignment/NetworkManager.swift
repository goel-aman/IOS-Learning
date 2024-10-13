//
//  NetworkManager.swift
//  HaatDeliveryAssignment
//
//  Created by aman on 13/10/24.
//

import Foundation

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case Network(Error?)
}

class NetworkManager {
    func request<T: Codable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            throw DataError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
