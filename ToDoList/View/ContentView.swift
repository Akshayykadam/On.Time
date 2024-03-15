//
//  ContentView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty{
            AccountView
        }
        else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var AccountView: some View{
        TabView{
            ToDoListView(userID: viewModel.currentUserID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
