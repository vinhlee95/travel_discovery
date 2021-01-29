//
//  DestinationView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

struct PopularDestinationsView: View {
    let destinations: [Destination] = [
        .init(city: "Paris", country: "France", imageName: "eiffel_tower", lat: 48.85965, lng: 2.353235),
        .init(city: "Tokyo", country: "Japan", imageName: "japan", lat: 35.6682233, lng: 139.6706567),
        .init(city: "New York", country: "America", imageName: "new_york", lat: 40.697403, lng: -74.1201055)
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
                    NavigationLink(
                        destination: LazyView(DestinationDetailsView(city: destination.city, country: destination.country, image: destination.imageName, lat: destination.lat, lng: destination.lng)),
                        label: {
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
                                        .smallSemiboldText()
                                        .foregroundColor(.black)
                                    Text(destination.country)
                                        .smallSemiboldText()
                                        .foregroundColor(.gray)
                                }
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                            }
                            .tileStyle()
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
