//
//  HeaderView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColour: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColour)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                    //.offset(y: 10)
                Text(subTitle)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    //.offset(y: 10)
            }
            .padding(.top,30)
        }
        .frame(width: UIScreen.main.bounds.width*3, height: 350)
        .offset(y: -120)
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Subtitle", angle: 10, backgroundColour: .blue)
}
