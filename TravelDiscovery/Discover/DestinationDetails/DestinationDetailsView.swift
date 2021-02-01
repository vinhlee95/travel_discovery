//
//  DestinationDetailsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/29/21.
//

import SwiftUI
import MapKit

struct DestinationDetailsView: View {
    private let city, country, image: String
    private let lat, lng: Double
    @State var region: MKCoordinateRegion
    @State var showAttractions = false
    
    init(city: String, country: String, image: String, lat: Double, lng: Double) {
        self.city = city
        self.country = country
        self.image = image
        self.lat = lat
        self.lng = lng
        self._region = State(initialValue: MKCoordinateRegion(center: .init(latitude: lat, longitude: lng), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
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
                    .font(.system(size: 16, weight: .bold))
                Text(country).font(.system(size: 16))
                
                HStack {
                    ForEach(0..<5) { num in
                        Image(systemName: "star.fill")
                            .padding(.vertical, 4)
                    }.foregroundColor(.orange)
                }
                
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.").font(.system(size: 14))
                
                HStack {Spacer()}
            }.padding(.horizontal)
            .padding(.top, 44)
            
            HStack {
                Text("Location").font(.system(size: 16, weight: .bold))
                Spacer()
                Button(action: {showAttractions.toggle()}, label: {
                    Text("\(showAttractions ? "Hide" : "Show") attractions").font(.system(size: 14, weight: .semibold))
                })
                Toggle("", isOn: $showAttractions).labelsHidden()
            }.padding(.horizontal)
            
            // $region is bound to the Map
            // meaning region state variable will be updated when user moves around the map
            Map(coordinateRegion: $region, annotationItems: showAttractions ? attractions : []) { attraction in
                MapMarker(coordinate: .init(latitude: attraction.lat, longitude: attraction.lng), tint: .red)
            }.frame(height: 300)
            
        }.navigationBarTitle(city, displayMode: .inline)
    }
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel tower", lat: 48.85965, lng: 2.353235),
        .init(name: "Champs-Elysees", lat: 48.866867, lng: 2.311780),
        .init(name: "Louvre Museum", lat: 48.860288, lng: 2.337789)
    ]
}



struct DestinationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationDetailsView(city: "Paris", country: "France", image: "eiffel_tower", lat: 48.85965, lng: 2.353235)
        }
    }
}
