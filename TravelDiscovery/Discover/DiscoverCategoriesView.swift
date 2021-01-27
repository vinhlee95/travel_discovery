//
//  DiscoverCategoriesView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

struct DiscoverCategoriesView: View {
    // iconName is retrieved from SF Symbols app
    let categories: [Category] = [
        .init(title: "Art", iconName: "paintpalette.fill"),
        .init(title: "Sport", iconName: "sportscourt.fill"),
        .init(title: "Live Events", iconName: "music.mic"),
        .init(title: "Food", iconName: "tray.fill"),
        .init(title: "History", iconName: "books.vertical.fill")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink(
                        destination: CategoryDetailsView(),
                        label: {
                            VStack(content: {
                                Image(systemName: category.iconName)
                                    .frame(width: 68, height: 68, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.primaryColor)
                                    .background(Color.white)
                                    .cornerRadius(34)
                                    .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                                
                                Text(category.title)
                                    .smallSemiboldText()
                                    .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                                    .foregroundColor(.white)
                            })
                        }
                    )
                }
            }.padding(.horizontal)
        })
    }
}

struct CategoryDetailsView: View {
    var body: some View {
        ScrollView {
            ForEach(1..<3, id: \.self) { num in
                VStack(alignment: .leading, spacing: 0) {
                    Image("art\(num)")
                        .resizable()
                        .scaledToFill()
                        .tileStyle()
                    Text("Image title")
                        .smallSemiboldText()
                }.padding()
            }
        }.navigationBarTitle("Category", displayMode: .inline)
    }
}

struct DiscoverCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
//        DiscoverCategoriesView()
        NavigationView {
            CategoryDetailsView()
        }
        DiscoverView()
    }
}
