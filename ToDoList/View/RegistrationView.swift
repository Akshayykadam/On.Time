//
//  RegistrationView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var regView = RegistrationViewViewModel()
    
    
    var body: some View {
        VStack{
            HeaderView(title: "Sign Up", subTitle: "It's quick and easy.", angle: 10, backgroundColour: .blue)
            
            Form{
                TextField("Full Name", text: $regView.name)
                .frame(width: 300, height: 40)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                
                TextField("Email Address", text: $regView.email)
                .frame(width: 300, height: 40)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                SecureField("Password", text: $regView.password)
                .frame(width: 300, height: 40)
                .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Sign Up", backgroundColour: .blue, action: ({
                    //Register Action
                    regView.RegisterUser()
                }))
                .padding()
            }
            .offset(y: -85)
        }
        Spacer()
    }
}

#Preview {
    RegistrationView()
}
