//
//  TLButton.swift
//  ToDoList
//
//  Created by Akshay Kadam on 14/03/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let backgroundColour: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(backgroundColour)
                    .frame(width: 300, height: 45)
                    .font(.system(size: 20))
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        })
    }
}

#Preview {
    TLButton(title: "Login", backgroundColour: .blue, action: ({
        
    }))
}
