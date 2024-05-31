//
//  ToDoListViewModel.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject{
    
    @Published var showInNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func changeShowInNewItemView(value: Bool){
        showInNewItemView = value
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id  to delete
    
    func deleteItem(itemId: String){
        let db = Firestore.firestore()
        db.collection(NetworkPath.user.rawValue)
            .document(userId)
            .collection(NetworkPath.todos.rawValue)
            .document(itemId)
            .delete()
    }
    
    
}
