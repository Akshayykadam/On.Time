//
//  RegistrationViewViewModel.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegistrationViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    
    init(){
    }
    
    func RegisterUser()
    {
        guard ValidateUser() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self]result, error in
            guard let userID = result?.user.uid else{
                return
            }
            
            self?.InsertUserRecord(id: userID)
        }
    }
    
    private func InsertUserRecord(id: String){
        let newUser = User(id: id, 
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func ValidateUser() -> Bool
    {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all field"
            return false
        }
        
        guard email.contains("@") && email.contains(".")else
        {
            errorMessage = "Invalid email"
            return false
        }
        
        guard password.count >= 8 else
        {
            errorMessage = "Invalid password"
            return false
        }
        
        return true
    }
}
