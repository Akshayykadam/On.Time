//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//



import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
