//
//  Foods.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import Foundation

struct FoodModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct FoodResponse: Decodable {
    let request: [FoodModel]
}

struct MockData {
    static let sampleFood = FoodModel(
        id: 0001,
        name:  "Test Food",
        description: "This is the description for my food dish. It's yummy",
        price: 9.99,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    
    static let foods = [sampleFood, sampleFood, sampleFood, sampleFood]
}
