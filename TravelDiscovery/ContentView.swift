//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // Scroll main view
            ScrollView {
                DiscoverCategoriesView()
                PopularDestinationsView()
                PopularPlacesView()
                TrendingCreatorsView()
            }
            .navigationTitle("Discover")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct Category: Hashable {
    let title: String
    let iconName: String
}

struct DiscoverCategoriesView: View {
    // iconName is retrieved from SF Symbols app
    let categories: [Category] = [
        .init(title: "Art", iconName: "paintpalette.fill"),
        .init(title: "Sport", iconName: "sportscourt.fill"),
        .init(title: "Live Events", iconName: "music.mic"),
        .init(title: "Food", iconName: "tray.fill"),
        .init(title: "History", iconName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    VStack(content: {
                        Image(systemName: category.iconName)
                            .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .background(Color.gray)
                            .cornerRadius(34)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text(category.title)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
    }
}

struct Destination: Hashable {
    let city, country, imageName: String
}

struct PopularDestinationsView: View {
    let destinations: [Destination] = [
        .init(city: "Paris", country: "France", imageName: "eiffel_tower"),
        .init(city: "Tokyo", country: "Japan", imageName: "japan"),
        .init(city: "New York", country: "America", imageName: "new_york")
    ]
    
    var body: some View {
        HStack {
            Text("Popular destinations")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false) {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(destinations, id: \.self) { destination in
                    VStack(alignment: .leading, spacing: 0){
                        Image(destination.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 125, height: 125)
                            // cornerRadius has to be defined before paddings
                            .cornerRadius(5)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 6)
                        
                        VStack {
                            Text(destination.city)
                                .font(.system(size: 12, weight: .semibold))
                            Text(destination.country)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 8)
                    }
                        .background(Color(.init(white: 0.9, alpha: 1)))
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        .padding(.bottom, 12)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PopularPlacesView: View {
    var body: some View {
        HStack {
            Text("Popular places to eat")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(1 ..< 8) { value in
                    VStack(content: {
                        Spacer()
                            .frame(width: 220, height: 80, alignment: .center)
                            .background(Color.gray)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text("Place \(value)")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
    }
}

struct TrendingCreatorsView: View {
    var body: some View {
        HStack {
            Text("Trending Creators")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(1 ..< 8) { value in
                    VStack(content: {
                        Spacer()
                            .frame(width: 50, height: 50, alignment: .center)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text("Creator \(value)")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
    }
}
