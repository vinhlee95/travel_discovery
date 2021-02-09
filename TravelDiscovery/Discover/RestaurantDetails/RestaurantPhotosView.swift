//
//  RestaurantPhotosView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/9/21.
//

import SwiftUI
import Kingfisher

let GRID_MODE = "Grid"
let LIST_MODE = "List"

struct RestaurantPhotosView: View {
    let imageUrls: [String]
    let availableModes = [GRID_MODE, LIST_MODE]
    @State var mode = GRID_MODE
    
    var body: some View {
        ScrollView {
            Picker("Image picker", selection: $mode) {
                ForEach(availableModes, id: \.self) {
                    Text($0)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            if mode == GRID_MODE {
                RestaurantImagesGridView(imageUrls: imageUrls)
            } else {
                RestaurantImagesListView(imageUrls: imageUrls)
            }
        }.navigationBarTitle("All photos", displayMode: .inline)
    }
}

struct RestaurantImagesGridView: View {
    let imageUrls: [String]
    var body: some View {
        GeometryReader { geometry in
            LazyVGrid(
                // define grid system and spacing between COLUMNS
                columns: [
                    GridItem(.adaptive(minimum: geometry.size.width/3 - 20, maximum: 300), spacing: 16)
                ],
                // define spacing between ROWS
                spacing: 4,
                content: {
                    ForEach(imageUrls, id: \.self) {imageUrl in
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width/3, height: geometry.size.width/3)
                            .clipped()
                    }
                }
            ).padding(.horizontal, 4)
        }
    }
}

struct RestaurantImagesListView: View {
    let imageUrls: [String]
    
    var body: some View {
        ScrollView {
            ForEach(imageUrls, id: \.self) {imageUrl in
                VStack {
                    KFImage(URL(string: imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                    
                    VStack(alignment: .leading) {
                        Text("Here is the description of the photo. Here is the description of the photo. Here is the description of the photo. Here is the description of the photo.")
                            .padding(.bottom, 8)
                        
                        Text("Posted on January 1, 2021.")
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                    }.padding(.horizontal, 4)
                }.padding(.bottom)
            }
        }
    }
}

let TEST_IMAGE_URLS = [
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/e2f3f5d4-5993-4536-9d8d-b505d7986a5c",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a4d85eff-4c79-4141-a0d6-761cca48eae1",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/20a6783b-3de7-4e58-9e22-bcc6a43b6df6",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/0d1d2e79-2f10-4cfd-82da-a1c2ab3638d2",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3923d237-3931-44e5-836f-5de40ec04b31",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/254c0418-2b55-4a2b-b530-a31a9799c7d5",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/fa20d064-b6d7-4df9-8f44-0f25f6ee5a19",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a441d22b-5324-4444-8ddf-22b99128838c",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/6b5d013b-dc3b-4e5e-93d9-ec932f42aead",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a6de1d65-8fa3-4674-a6ce-a207b8f86b15",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/5c6bc68c-a8a1-42ac-ab3a-947927826807",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a5e83c0c-c815-4129-bfd4-17e73fa1da78",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/f6ee5fb7-b21b-42c1-b1d8-a455742d0247",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/c22e8d9e-10f2-4559-8c81-375491295e84",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/3a352f87-3dc1-4fa7-affe-fb12fa8691fe",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/8ca76521-1f52-4043-8b86-d2a573342daf",
    "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/73f69749-f986-46ac-9b8b-d7b1d42bddc5"
    ]

struct RestaurantPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantPhotosView(imageUrls: TEST_IMAGE_URLS)
        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .previewLayout(.fixed(width: 1024, height: 768))
    }
}
