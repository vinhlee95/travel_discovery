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

struct DiscoverCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(1 ..< 8) { value in
                    VStack(content: {
                        Spacer()
                            .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text("Category \(value)")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
    }
}

struct PopularDestinationsView: View {
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
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(1 ..< 8) { value in
                    VStack(content: {
                        Spacer()
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
                            .cornerRadius(12)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text("Destination \(value)")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
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
