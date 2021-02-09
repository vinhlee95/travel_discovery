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
                    RestaurantHeader(photo: restaurantDetail.thumbnail, name: restaurantDetail.name, imageUrls: restaurantDetail.photos).scaledToFit()
                    
                    VStack(alignment: .leading) {
                        RestaurantDescription(restaurantDetail: restaurantDetail)
                        
                        Text("Popular dishes").heading().padding(.vertical, 8)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(restaurantDetail.popularDishes, id: \.self) {dish in
                                    DishCard(dish: dish).frame(height: 120)
                                }
                            }
                        }
                        
                        Text("Customer reviews").heading().padding(.vertical, 8)
                        VStack {
                            ForEach(restaurantDetail.reviews, id: \.self) { review in
                                ReviewCell(review: review)
                                
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
    let imageUrls: [String]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(URL(string: photo))
                .resizable()
                .scaledToFill()
            
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold))
                    
                    HStack {
                        ForEach(0..<5, id: \.self) { number in
                            Image(systemName: "star.fill")
                        }.foregroundColor(.yellow)
                    }
                }
                
                Spacer()
                
                NavigationLink(
                    destination: LazyView(RestaurantPhotosView(imageUrls: imageUrls)),
                    label: {
                        Text("See more photos").foregroundColor(.white).frame(width: 80)
                    })
            }.padding()
            
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
        
        Text(restaurantDetail.description).displayFullSize()
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

struct ReviewCell: View {
    let review: Review
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: review.user.profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                
                VStack(alignment: .leading) {
                    Text("\(review.user.firstName) \(review.user.lastName)")
                        .smallSemiboldText()
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5, id: \.self) {number in
                            if number < review.rating {
                                Image(systemName: "star.fill").foregroundColor(.yellow).font(.system(size: 12))
                            } else {
                                Image(systemName: "star.fill").font(.system(size: 12))
                            }
                        }
                    }
                }
                
                Spacer()
                Text("Dec 2020").font(.system(size: 12))
            }
            
            Text(review.text).font(.system(size: 14)).displayFullSize()
        }.padding(.bottom)
    }
}


struct RestaurantDetailsview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(id: Int("0")!)
        }
    }
}
