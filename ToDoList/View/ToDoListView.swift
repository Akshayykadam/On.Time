//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Akshay Kadam on 13/03/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userID: String
    
    init(userID: String){
        self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID))
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button(action: {
                                ///Delete Action
                                viewModel.delete(id: item.id)
                            }, label: {
                                Text("Delete")
                            })
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Task List")
            .toolbar{
                Button(action: {
                    //Action
                    viewModel.showNewItemView = true
                }, label: {
                    Image(systemName: "plus.circle")
                })
                
                .sheet(isPresented: $viewModel.showNewItemView) {
                    NewItemView(newItemPresented:$viewModel.showNewItemView)
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "a9AnIMnPSMSUtAiQeSzpH7Vblce2")
}
