//
//  CategoryDetailsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/28/21.
//

import SwiftUI
import Kingfisher

// ViewModel containing logic
class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var places = [Place]()
    @Published var errorMessage: String = ""
    
    init(category: String) {
        print("Fetching data for category \(category)")
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(category)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.errorMessage = "Unable to fetch data for the category. Bad status code \(statusCode)."
                    self.isLoading = false
                    return
                }
                
                guard let data = data else {
                    self.isLoading = false
                    return
                }
                
                do {
                    self.places = try JSONDecoder().decode([Place].self, from: data)
                } catch {
                    print("Failed to decode JSON", error)
                    self.errorMessage = error.localizedDescription
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}

// Dumb View that renders the UI
struct CategoryDetailsView: View {
    private let name: String
    @ObservedObject private var observable: CategoryDetailsViewModel
    
    init(name: String, category: String) {
        self.name = name
        self.observable = CategoryDetailsViewModel(category: category)
    }
    
    var body: some View {
        ZStack {
            if observable.isLoading {
                ActivityIndicatorView()
            } else {
                ZStack {
                    Text(observable.errorMessage)
                    ScrollView {
                        ForEach(observable.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                KFImage(URL(string: place.thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                    .tileStyle()
                                Text(place.name)
                                    .smallSemiboldText()
                            }.padding()
                        }
                    }
                }
            }
        }.navigationBarTitle(name, displayMode: .inline)
    }
}
