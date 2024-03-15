//
//  NewItemView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Add a new task")
                .bold()
                .font(.system(size: 25))
                .padding(.top, 50)
                
            
            Form{
                //Task Title
                TextField("What do you need to?", text: $viewModel.title)
                    .frame(width: 300, height: 50)
                    .font(.system(size: 20))
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Date Picker
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Add Task Button
                TLButton(title: "Save",
                         backgroundColour: .blue, action: ({
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                    
                }))
                .padding()
            }
            
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please complete all fields and choose a due date that is today or later."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    },set: {_ in
        
    }))
}
