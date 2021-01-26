//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/22/21.
//

import SwiftUI

struct DiscoverView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.683354039, blue: 0.2954197473, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7056216287, blue: 0.2278487719, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Color(.init(white: 0.95, alpha: 1)).offset(y: 300)
                
                // Scroll main view
                ScrollView {
                    DiscoverCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularPlacesView()
                        TrendingCreatorsView()
                    }.background(Color(.init(white: 0.95, alpha: 1)))
                    .cornerRadius(16)
                    .padding(.top, 12)
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            
    }
}
