//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel:ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    
    func save(){
        
        guard canSave else{
            return
        }
        
        // get current UserId
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        // save the model in database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}
