//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import Foundation

struct Destination: Hashable {
    let city, country, imageName: String
    let lat, lng: Double
}

struct Category: Hashable {
    let title: String
    let iconName: String
    let category: String
}

struct Restaurant: Hashable {
    let name, imageName: String
    let id: Int
}

struct Creator: Hashable {
    let name, image: String
}

struct Place: Decodable, Hashable {
    let name, thumbnail, country: String
    let id: Int
}

struct Attraction: Identifiable {
    let id = UUID().uuidString
    
    let name, image: String
    let lat, lng: Double
}

struct DestinationModel: Decodable {
    let name, country, description, thumbnail: String
    let photos: [String]
    let latitude, longitude: Double
}

