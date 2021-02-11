//
//  DestinationDetailsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/29/21.
//

import SwiftUI
import MapKit

// ViewModel
class DestinationDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destination: DestinationModel?
    @Published var errorMessage: String = ""
    @Published var region = MKCoordinateRegion(center: .init(latitude: 48.85965, longitude: 2.353235), span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    init(city: String) {
        print("Fetch details for destination: \(city)")
        let formattedCity = city.lowercased()
        let urlString = "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(formattedCity)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.errorMessage = "Unable to fetch data for the city: \(city). Bad status code \(statusCode)."
                    self.isLoading = false
                    return
                }

                guard let data = data else {
                    self.isLoading = false
                    return
                }

                do {
                    self.destination = try JSONDecoder().decode(DestinationModel.self, from: data)
                    self.region = MKCoordinateRegion(center: .init(latitude: self.destination!.latitude, longitude: self.destination!.longitude), span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
                } catch {
                    print("Failed to decode JSON", error.localizedDescription, error)
                    self.errorMessage = "Cannot show the data for destination city."
                }
                
                self.isLoading = false
            }
        }.resume()
    }
}

struct DestinationDetailsView: View {
    private let city: String
    @State var showAttractions = true
    
    @ObservedObject private var observable: DestinationDetailsViewModel
    
    init(city: String) {
        self.city = city
        self.observable = DestinationDetailsViewModel(city: city)
    }
    
    var body: some View {
        if observable.isLoading {
            ActivityIndicatorView()
        } else if observable.errorMessage != "" {
            Text(observable.errorMessage)
        } else {
            let destination = observable.destination
            
            if let destination = destination {
                ScrollView {
                    CarouselImageViewContainer(imageUrls: destination.photos, shouldFillFrame: true, activeIndex: 0)
                        .frame(height: 250)
                                
                    VStack(alignment: .leading) {
                        Text(city)
                            .font(.system(size: 16, weight: .bold))
                        Text(destination.country).font(.system(size: 16))
                        
                        HStack {
                            ForEach(0..<5) { num in
                                Image(systemName: "star.fill")
                                    .padding(.vertical, 4)
                            }.foregroundColor(.orange)
                        }
                        
                        Text(destination.description).font(.system(size: 14))
                        
                        HStack {Spacer()}
                    }.padding(.horizontal)
                    
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
                    Map(coordinateRegion: $observable.region, annotationItems: showAttractions ? attractions : []) { attraction in
                        MapAnnotation(coordinate: .init(latitude: attraction.lat, longitude: attraction.lng), content: {
                            VStack {
                                Image(attraction.image)
                                    .resizable()
                                    .frame(width: 80, height: 60)
                                    .cornerRadius(8)
                                Text(attraction.name)
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 4)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14))
                                    .cornerRadius(4)
                                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.blue))
                            }.shadow(radius: 5)
                        })
                    }.frame(height: 300)
                }.navigationBarTitle(city, displayMode: .inline)
            } else {
                Text("No data for this destination.")
            }
        }
    }
    
    let attractions: [Attraction] = [
        .init(name: "Eiffel tower", image: "eiffel_tower", lat: 48.85965, lng: 2.353235),
        .init(name: "Champs-Elysees", image: "japan", lat: 48.866867, lng: 2.311780),
        .init(name: "Louvre Museum", image: "new_york", lat: 48.860288, lng: 2.337789)
    ]
}



struct DestinationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DestinationDetailsView(city: "New York")
        }
    }
}
