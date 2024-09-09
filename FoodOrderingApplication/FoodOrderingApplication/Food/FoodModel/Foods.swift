//
//  Foods.swift
//  FoodOrderingApplication
//
//  Created by aman on 02/06/24.
//

import Foundation

struct FoodModel: Decodable, Identifiable, Hashable {
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
        id: 4,
        name:  "Test Food",
        description: "This is the description for my food dish. It's yummy",
        price: 9.99,
        imageURL: "",
        calories: 99,
        protein: 99,
        carbs: 99)
    
    static let foods = [sampleFood, sampleFood, sampleFood, sampleFood]
    
    
    static let orderItemOne = FoodModel(
        id: 5,
        name:  "Test Food One",
        description: "This is the description for my food dish. It's yummy",
        price: 29.99,
        imageURL: "",
        calories: 199,
        protein: 299,
        carbs: 399)
    
    static let orderItemTwo = FoodModel(
        id: 6,
        name:  "Test Food Three",
        description: "This is the description for my food dish. It's yummy",
        price: 94.99,
        imageURL: "",
        calories: 199,
        protein: 699,
        carbs: 999)
    
    static let orderItemThree = FoodModel(
        id: 7,
        name:  "Test Food Three",
        description: "This is the description for my food dish. It's yummy",
        price: 8.99,
        imageURL: "",
        calories: 999,
        protein: 199,
        carbs: 399)
    
    static var orders: [FoodModel] = []
}
