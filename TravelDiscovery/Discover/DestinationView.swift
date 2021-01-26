//
//  DestinationView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

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
                                .smallSemiboldText()
                            Text(destination.country)
                                .smallSemiboldText()
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 12)
                        .padding(.bottom, 8)
                    }
                    .tileStyle()
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DestinationView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationsView()
    }
}
