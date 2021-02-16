//
//  UserDetailsView.swift
//  TravelDiscovery
//
//  Created by Vinh Le on 2/15/21.
//

import SwiftUI
import Kingfisher

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            UserDetailsHeader(user: user)
        }
        .navigationBarTitle(user.getFullname(), displayMode: .inline)
        .padding(.horizontal)
    }
}

struct UserDetailsHeader: View {
    let user: User
    
    var body: some View {
        KFImage(URL(string: user.profileImage))
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .cornerRadius(30)
        
        Text(user.getFullname())
            .font(.system(size: 16, weight: .bold))
            .padding(.bottom, 8)
        
        HStack {
            Text("@\(user.username)")
            Image(systemName: "hand.thumbsup.fill")
            Text("1234")
        }.padding(.bottom, 8).font(.system(size: 14, weight: .semibold))
        
        Text("YouTuber, Vlogger, Travel Creator")
            .padding(.bottom, 8)
            .font(.system(size: 14))
            .foregroundColor(Color.gray)
        
        HStack(spacing: 16) {
            VStack {
                Text(String(user.followers)).font(.system(size: 16, weight: .bold))
                Text("Followers").smallSemiboldText()
            }
            VStack {
                Text(String(user.following)).font(.system(size: 16, weight: .bold))
                Text("Following").smallSemiboldText()
            }
        }
        
        HStack(spacing: 12) {
            Button(action: {}, label: {
                HStack {
                    Spacer()
                    Text("Follow").foregroundColor(.white)
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color.orange)
                .cornerRadius(100)
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Spacer()
                    Text("Contact")
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding(.vertical, 8)
                .background(Color(white: 0.9))
                .cornerRadius(100)
            })
            
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(firstName: "Foo", lastName: "Bar", username: "foobar", profileImage: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a41cf22c-578d-456f-b0c4-90d5c017eab1", followers: 1234, following: 1243))
        }
    }
}
