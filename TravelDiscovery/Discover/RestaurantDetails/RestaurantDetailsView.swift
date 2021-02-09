//
//  RestaurantDetailsview.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/6/21.
//

import SwiftUI
import Kingfisher

struct RestaurantDetailsView: View {
    private let id: Int
    @ObservedObject private var observable: RestaurantDetailsViewModel
    
    init(id: Int) {
        self.id = id
        self.observable = RestaurantDetailsViewModel(id: id)
    }
    
    var body: some View {
        if observable.isLoading {
            ActivityIndicatorView()
        } else if observable.errorMessage != "" {
            Text(observable.errorMessage)
        } else {
            if let restaurantDetail = observable.restaurantDetail {
                ScrollView() {
                    RestaurantHeader(photo: restaurantDetail.thumbnail, name: restaurantDetail.name).scaledToFit()
                    
                    VStack(alignment: .leading) {
                        RestaurantDescription(restaurantDetail: restaurantDetail)
                        
                        // Hack to make the description fully displayed
                        Spacer()
                        
                        Text("Popular dishes").heading().padding(.vertical, 8)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(restaurantDetail.popularDishes, id: \.self) {dish in
                                    DishCard(dish: dish)
                                        .frame(height: 120)
                                }
                            }
                        }
                        
                    }.padding(.horizontal, 8).padding(.vertical)
                    
                }.navigationBarTitle("Restaurant Details", displayMode: .inline)
            }
        }
    }
}

struct RestaurantHeader: View {
    let photo, name: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: photo))
                .resizable()
                .scaledToFill()
            
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                VStack {
                    Text(name)
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
    }
}

struct RestaurantDescription: View {
    let restaurantDetail: RestaurantDetail
    
    var body: some View {
        Text("Location & Description").heading().padding(.bottom, 4)
        Text("\(restaurantDetail.city), \(restaurantDetail.country)").padding(.bottom, 2)
        
        HStack {
            ForEach(0..<3, id: \.self) {number in
                Image(systemName: "dollarsign.circle.fill")
            }.foregroundColor(.orange)
        }.padding(.bottom, 8)
        
        Text(restaurantDetail.description)
    }
}

struct DishCard: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomTrailing) {
                KFImage(URL(string: dish.photo))
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    Text(dish.price)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                        .padding(.leading, 4)
                    Spacer()
                }
            }.cornerRadius(8)
            
            Text(dish.name).smallSemiboldText()
            Text(String(dish.numPhotos)).font(.system(size: 12)).foregroundColor(.gray)
        }
    }
}

struct RestaurantDetailsview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(id: Int("0")!)
        }
    }
}
