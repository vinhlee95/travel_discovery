//
//  RestaurantDetailsview.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/6/21.
//

import SwiftUI

struct RestaurantDetailsView: View {
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView() {
            ZStack(alignment: .bottomLeading) {
                Image(restaurant.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack {
                        Text(restaurant.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(0..<5, id: \.self) { number in
                                Image(systemName: "star.fill")
                            }.foregroundColor(.yellow)
                        }
                    }.padding()
                    
                    Spacer()
                    
                    Text("See more photos")
                        .foregroundColor(.white)
                }.padding(.horizontal, 8)
                
            }
            
            VStack(alignment: .leading) {
                Text("Location & Description").heading().padding(.bottom, 4)
                
                Text("Tokyo, Japan").padding(.bottom, 2)
                
                HStack {
                    ForEach(0..<3, id: \.self) {number in
                        Image(systemName: "dollarsign.circle.fill")
                    }.foregroundColor(.orange)
                }.padding(.bottom, 8)
                
                Text("Very long description of this restaurant. Very long description of this restaurant. Very long description of this restaurant. Very long description of this restaurant.")
                
                Text("Popular dishes").heading().padding(.vertical, 8)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<3, id: \.self) {number in
                            VStack(alignment: .leading) {
                                Image(restaurant.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150)
                                    .cornerRadius(8)
                                
                                Text("Japanese Tapas").smallSemiboldText()
                                Text("79 photos").font(.system(size: 12)).foregroundColor(.gray)
                            }
                        }
                    }
                }
                
            }.padding(.horizontal, 8).padding(.vertical)
            
        }.navigationBarTitle("Restaurant Details", displayMode: .inline)
    }
}

struct RestaurantDetailsview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(restaurant: .init(name: "Japan's Finest Tapas", imageName: "tapas"))
        }
    }
}
