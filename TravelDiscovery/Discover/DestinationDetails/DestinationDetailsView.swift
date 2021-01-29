//
//  DestinationDetailsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/29/21.
//

import SwiftUI

struct DestinationDetailsView: View {
    private let city, country, image: String
    
    init(city: String, country: String, image: String) {
        self.city = city
        self.country = country
        self.image = image
    }
    
    var body: some View {
        ScrollView {
            Image(image)
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(height: 200)
                        
            VStack(alignment: .leading) {
                Text(city)
                    .font(.system(size: 18, weight: .bold))
                Text(country)
                
                HStack {
                    ForEach(0..<5) { num in
                        Image(systemName: "star.fill")
                            .padding(.vertical, 4)
                    }.foregroundColor(.orange)
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                
                HStack {Spacer()}
            }.padding(.horizontal)
            .padding(.top, 44)
        }.navigationBarTitle(city, displayMode: .inline)
    }
}

struct DestinationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationDetailsView(city: "Paris", country: "France", image: "eiffel_tower")
        }
    }
}
