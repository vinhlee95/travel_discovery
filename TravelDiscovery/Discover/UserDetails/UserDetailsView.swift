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
            UserPostList(user: user)
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

struct UserPostList: View {
    let user: User
    var body: some View {
        ForEach(user.posts, id: \.self) {post in
            VStack(alignment: .leading) {
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                HStack {
                    KFImage(URL(string: user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text(post.title).font(.system(size: 14, weight: .semibold))
                        Text(post.views).font(.system(size: 14)).foregroundColor(Color.gray)
                    }
                }.padding(.horizontal)
                HStack {
                    ForEach(post.hashtags, id: \.self) {tag in
                        Text("# \(tag)")
                            .foregroundColor(Color(#colorLiteral(red: 0.07797152549, green: 0.513774395, blue: 0.9998757243, alpha: 1)))
                            .smallSemiboldText()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color(#colorLiteral(red: 0.9057956338, green: 0.9333867431, blue: 0.9763537049, alpha: 1)))
                            .cornerRadius(20)
                    }
                }.padding(.horizontal).padding(.bottom)
            }.background(Color(white: 1))
            .cornerRadius(12)
            .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailsView(user: .init(firstName: "Foo", lastName: "Bar", username: "foobar", profileImage: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/a41cf22c-578d-456f-b0c4-90d5c017eab1", followers: 1234, following: 1243, posts: [.init(title: "Traveling in Dubai", imageUrl: "https://letsbuildthatapp-videos.s3.us-west-2.amazonaws.com/288b811b-048c-4427-a875-2edc65c23d76", views: "20K", hashtags: [
                "Traveling",
                "Relaxing",
                "Unforgettable"
            ])]))
        }
    }
}
