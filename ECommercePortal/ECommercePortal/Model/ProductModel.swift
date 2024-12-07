//
//  ProductModel.swift
//  ECommercePortal
//
//  Created by aman on 29/11/24.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let category: Category?
    let price, discountPercentage, rating: Double?
    let stock: Int?
    let tags: [String]?
    let sku: String?
    let weight: Int?
    let dimensions: Dimensions?
    let warrantyInformation, shippingInformation: String?
    let availabilityStatus: AvailabilityStatus?
    let reviews: [Review]?
    let returnPolicy: String?
    let minimumOrderQuantity: Int?
    let meta: Meta?
    let images: [String]?
    let thumbnail: String?
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
    case outOfStock = "Out of Stock"
}

enum Category: String, Codable {
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt?
    let barcode: String?
    let qrCode: String?
}

enum CreatedAt: String, Codable {
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
    case the20240523T085621621Z = "2024-05-23T08:56:21.621Z"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int?
    let comment: String?
    let date: CreatedAt?
    let reviewerName, reviewerEmail: String?
}
