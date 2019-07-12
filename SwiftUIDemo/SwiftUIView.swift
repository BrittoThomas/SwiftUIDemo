//
//  SwiftUIView.swift
//  SwiftUIDemo
//
//  Created by Britto Thomas on 12/07/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import SwiftUI

struct Post: Identifiable {
    var id: Int
    let name, message, imageName: String
}


struct PostDetail : View {
    var body: some View {
        Text("Detail Page")
    }
}

struct SwiftUIView : View {
    
    let users : [User] = [
        .init(id: 0, name: "Tim Cook", message: "", imageName: "tim_cook"),
        .init(id: 1, name: "Craif Federighi", message: "", imageName: "craif_federighi"),
        .init(id: 2, name: "Jon Ivey", message: "", imageName: "jony_ive"),
        .init(id: 3, name: "Tim Cook", message: "", imageName: "tim_cook"),
        .init(id: 4, name: "Craif Federighi", message: "", imageName: "craif_federighi"),
        .init(id: 5, name: "Jon Ivey", message: "", imageName: "jony_ive"),
        .init(id: 6, name: "Tim Cook", message: "", imageName: "tim_cook"),
        .init(id: 7, name: "Craif Federighi", message: "", imageName: "craif_federighi"),
        .init(id: 8, name: "Jon Ivey", message: "", imageName: "jony_ive")
    ]
    
    let posts : [Post] = [
        .init(id: 0, name: "Tim Cook", message: "The time is here, let's try .", imageName: "post1"),
        .init(id: 1, name: "Craif Federighi", message: "The time is here, let's try .", imageName: "post2"),
        .init(id: 2, name: "Jon Ivey", message: "My nice shiny new monitor stand is $999 My nice shiny new monitor stand is $999", imageName: "post3"),
        .init(id: 3, name: "Jon Ivey", message: "Lots and lots of interesting applications you can build with SwiftUI, including some very complex layouts that can be achieved with just a couple of widgets.  Let's dive into construction of a dynamic list of Users, along with constructing HStack and VStack elements for our rows.", imageName: "post4")
    ]
    
    var body: some View {
        NavigationView {
            List {
                Text("Users")
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack {

                        ForEach(users.identified(by: \.id)) { user in
                            NavigationLink.init(destination: PostDetail()) {
                                Image(user.imageName)
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 2))
                                
                                
                                
                                
                            }
                        }
                    }.frame(height: 80)
                     .padding(.leading, 20)
                }.frame(height: 80)
                .padding(.leading, -20)
                .padding(.trailing, -20)
                
                ForEach(posts.identified(by: \.id)) { post in
                    PostRow(post: post)
                }
            }.navigationBarTitle(Text("Groups"))
        }
    }
}

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack (alignment: .leading,spacing: 16){
            HStack {
                Image(post.imageName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
                    .clipped()
                VStack (alignment: .leading, spacing: 4) {
                    Text(post.name).font(.headline)
                    Text(post.name).font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16)
             .padding(.top, 16)
            Text(post.message)
                .lineLimit(nil)
                .padding(.leading, 16)
                .padding(.trailing, 32)
            Image(post.imageName)
                .scaledToFill()
                .frame(height: 350)
                .clipped()
        }.padding(.leading, -20)
         .padding(.bottom, -8)
         .padding(.trailing, -20)
        
    }
}

#if DEBUG
struct SwiftUIView_Previews : PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
#endif
