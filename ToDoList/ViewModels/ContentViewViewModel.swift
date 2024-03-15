//
//  ContentViewViewModel.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//
import FirebaseAuth
import Foundation

class ContentViewViewModel: ObservableObject{
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    
    init(){
        self.handler = Auth.auth().addIDTokenDidChangeListener { [weak self] _, User in
            DispatchQueue.main.async {
                self?.currentUserID = User?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
