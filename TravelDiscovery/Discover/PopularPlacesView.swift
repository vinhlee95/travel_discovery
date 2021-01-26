//
//  PopularPlacesView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

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
                        }.smallSemiboldText()
                    }
                    .frame(width: 220, height: 80, alignment: .center)
                    .tileStyle()
                }
            }
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

struct PopularPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularPlacesView()
    }
}
