//
//  NetworkManager.swift
//  ECommercePortal
//
//  Created by aman on 29/11/24.
//

import Foundation
import UIKit


class NetworkManager {
    func getData<T: Codable>(requestURL: URL) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: requestURL)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    public func fetch(_ url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        return try await fetch(request)
    }
    
}
