//
//  ContentView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/22/21.
//

import SwiftUI

struct ContentView: View {
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
                            .foregroundColor(Color(#colorLiteral(red: 0.8982358136, green: 0.5987940428, blue: 0.2159923648, alpha: 1)))
                            .background(Color.white)
                            .cornerRadius(34)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text(category.title)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                            .foregroundColor(.white)
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
                            .cornerRadius(4)
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
                    .background(Color.white)
                        .cornerRadius(12)
                        .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        .padding(.bottom, 12)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Restaurant: Hashable {
    let name, imageName: String
}

struct PopularPlacesView: View {
    let restaurants: [Restaurant] = [
        .init(name: "Japan's Finest Tapas", imageName: "tapas"),
        .init(name: "Bar & Grill", imageName: "bar_grill")
    ]
    
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
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(restaurants, id: \.self) { restaurant in
                    HStack(spacing: 8) {
                        // Image view
                        Image(restaurant.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60)
                            .clipped()
                            .cornerRadius(4)
                            .padding(.vertical, 8)
                            .padding(.leading, 8)
                                                
                        // Content view
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(restaurant.name)
                                Spacer()
                                Button(action: {}, label: {
                                    Image(systemName: "ellipsis").foregroundColor(.gray)
                                })
                            }
                            
                            HStack {
                                Image(systemName: "star.fill")
                                Text("4.7 - Sushi - $$")
                            }
                            
                            Text("Tokyo, Japan")
                        }.font(.system(size: 12, weight: .semibold))
                    }
                    .frame(width: 220, height: 80, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                }
            }
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

struct Creator: Hashable {
    let name, image: String
}

struct TrendingCreatorsView: View {
    let creators: [Creator] = [
        .init(name: "Amy Adams", image: "amy"),
        .init(name: "Billy Childs", image: "billy"),
        .init(name: "Sam Smith", image: "sam")
    ]
    
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
            HStack(alignment: .top, spacing: 12) {
                ForEach(creators, id: \.self) { creator in
                    VStack {
                        Image(creator.image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text(creator.name)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                            .lineLimit(1)
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        })
    }
}
