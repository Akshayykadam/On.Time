//
//  LoginView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "On Time", subTitle: "Manage Your Everyday Task", angle: 10, backgroundColour: .blue)
                
                //Login Form
                Form{
                    
                    //Error Massage
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                    .frame(width: 300, height: 40)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                    .frame(width: 300, height: 40)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", backgroundColour: .blue, action: ({
                        //Login Action
                        viewModel.Login()
                    }))
                    .padding()
                    //.offset(y: 10)
                }
                .offset(y: -55)
                //Create an Account
                VStack{
                    Text("Don't have an account")
                        .bold()
                        .offset(y: 5)
                    NavigationLink("Sign Up", destination: RegistrationView())
                    .offset(y: 10)
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
