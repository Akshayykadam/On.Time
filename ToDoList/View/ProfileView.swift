//
//  ProfileView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }else
                {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        //Avtar Image
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 100, height: 100)
            .padding()
        
        //Info: Name, Image, Email, Member date
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .omitted))")
                    
                
            }
        }
        .padding()
        //Sign Out Button
        TLButton(title: "Log Out",
            backgroundColour: .blue){
            viewModel.logOut()
            }
            .padding()
            Spacer()
    }
}

#Preview {
    ProfileView()
}
