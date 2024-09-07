//
//  UserModel.swift
//  AsyncAwait
//
//  Created by aman on 07/09/24.
//

import Foundation

struct UserModel: Codable {
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

