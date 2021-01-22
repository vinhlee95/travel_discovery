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
                ForEach(0 ..< 12) { value in
                    VStack(content: {
                        Spacer()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.gray)
                            .cornerRadius(.infinity)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text("Hello")
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                    })
                }
            }.padding(.horizontal)
        })
    }
}
