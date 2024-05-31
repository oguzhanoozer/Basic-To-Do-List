//
//  ToDoListView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var todoListVM: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItemModel]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "\(NetworkPath.user.rawValue)/\(userId)/\(NetworkPath.todos.rawValue)"
        )
        self._todoListVM = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            NormalButton(onTap: {
                                todoListVM.deleteItem(itemId: item.id)
                            }, title: "Delete")
                        }
                }
                .listStyle(PlainListStyle())
                
            
            }.navigationTitle("Tasks")
                .toolbar{
                    Button(action: {
                        todoListVM.changeShowInNewItemView(value: true)
                    }, label: {
                        Image(systemName: "plus")
                    })
                }.sheet(isPresented: $todoListVM.showInNewItemView, content: {
                    NewItemView(newItemPresented: $todoListVM.showInNewItemView)
                })
        }
    }
}

#Preview {
    ToDoListView(userId: "AJD4t7LbHWaNTAoNlxqWSkR3m753")
}
