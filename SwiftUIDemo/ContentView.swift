//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Britto Thomas on 11/07/19.
//  Copyright © 2019 Britto Thomas. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id: Int
    let name, message, imageName: String
}

struct ContentView : View {
    
    let users : [User] = [
        .init(id: 0, name: "Tim Cook", message: "My nice shiny new monitor stand is $999", imageName: "tim_cook"),
        .init(id: 1, name: "Craif Federighi", message: "My nice shiny new monitor stand is $999", imageName: "craif_federighi"),
        .init(id: 2, name: "Jon Ivey", message: "Lots and lots of interesting applications you can build with SwiftUI, including some very complex layouts that can be achieved with just a couple of widgets.  Let's dive into construction of a dynamic list of Users, along with constructing HStack and VStack elements for our rows.", imageName: "jony_ive")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users.identified(by: \.id)) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            
            //.clipped()
            VStack (alignment: .leading){
                Text(user.name).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(3)
            }.padding(.leading,8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
