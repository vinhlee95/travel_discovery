//
//  Destination.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import Foundation

struct Destination: Hashable {
    let city, country, imageName: String
}

struct Category: Hashable {
    let title: String
    let iconName: String
}

struct Restaurant: Hashable {
    let name, imageName: String
}

struct Creator: Hashable {
    let name, image: String
}

struct Place: Decodable, Hashable {
    let name, thumbnail, country: String
    let id: Int
}
