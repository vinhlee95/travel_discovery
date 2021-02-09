//
//  RestaurantDetailsViewModel.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/9/21.
//

import SwiftUI

struct RestaurantDetail: Hashable, Decodable {
    let id: Int
    let name, city, country, description: String
    let photos: [String]
    let thumbnail: String
    let popularDishes: [Dish]
    let reviews: [Review]
}

struct Dish: Decodable, Hashable {
    let name, price, photo: String
    let numPhotos: Int
}

struct Review: Decodable, Hashable {
    let user: ReviewUser
    let rating: Int
    let text: String
}

struct ReviewUser: Decodable, Hashable {
    let firstName, lastName, profileImage: String
}

class RestaurantDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var errorMessage = ""
    @Published var restaurantDetail: RestaurantDetail?
    
    init(id: Int) {
        print("Fetch details for restaurant with id: \(id)")
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=\(id)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.errorMessage = "Unable to fetch data for the restaurant with id: \(id). Bad status code \(statusCode)."
                    self.isLoading = false
                    return
                }
                
                guard let data = data else {
                    self.isLoading = false
                    return
                }

                do {
                    self.restaurantDetail = try JSONDecoder().decode(RestaurantDetail.self, from: data)
                } catch {
                    print("Failed to decode JSON", error.localizedDescription, error)
                    self.errorMessage = "Cannot show the data for this restaurant."
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}
