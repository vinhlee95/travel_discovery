//
//  TrendingCreatorsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 1/26/21.
//

import SwiftUI

struct TrendingCreatorsView: View {
    let creators: [Creator] = [
        .init(name: "Amy Adams", image: "amy"),
        .init(name: "Billy Childs", image: "billy"),
        .init(name: "Sam Smith", image: "sam")
    ]
    
    var body: some View {
        HStack {
            Text("Trending Creators")
                .font(.system(size: 14, weight: .semibold))
            Spacer()
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
        .padding(.horizontal)
        .padding(.top)
        
        ScrollView(.horizontal, showsIndicators: false, content: {
            // A horizontal stack of rounded icons
            HStack(alignment: .top, spacing: 12) {
                ForEach(creators, id: \.self) { creator in
                    VStack {
                        Image(creator.image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                            .shadow(color: .gray, radius: 5, x: 0.0, y: 2)
                        
                        Text(creator.name)
                            .font(.system(size: 12, weight: .semibold))
                            .padding(EdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0))
                            .lineLimit(1)
                    }.frame(width: 68)
                }
            }.padding(.horizontal)
        })
    }
}

struct TrendingCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsView()
    }
}
