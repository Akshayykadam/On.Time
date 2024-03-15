//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .bold()
                    .font(.system(size: 22))
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            
            Spacer()
            
            //Create a botton
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 24)
                    .foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123",
                                 title: "whats app",
                                 dueDate: Date().timeIntervalSince1970,
                                 createdDate: Date().timeIntervalSince1970,
                                 isDone: true))
}
