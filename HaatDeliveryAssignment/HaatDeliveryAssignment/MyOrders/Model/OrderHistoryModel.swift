//
//  OrderHistoryModel.swift
//  HaatDeliveryAssignment
//
//  Created by aman on 13/10/24.
//

import Foundation

struct OrderHistoryModel: Codable {
    let orderId: String?
    let dateAndTime: String?
    let referenceNumber: String?
    let arrivedAt: String?
    
    let restaurantDetail: RestaurantDetail?
//    
//    private enum CodingKeys: String, CodingKey {
//        case orderId
//    }
}

struct RestaurantDetail: Codable {
    let name: String?
    let images: [ImageData]?
}

struct ImageData: Codable {
    let serverImageUrl: String?
    let smallImageUrl: String?
}


