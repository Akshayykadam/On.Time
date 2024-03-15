//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    
    func Login()
    {
        guard Validate() else{
            return
        }
        
        // Login Use Auth
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func Validate() -> Bool
    {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".")else
        {errorMessage = "Invalid email"
            return false
        }
        
        return true
    }
}
