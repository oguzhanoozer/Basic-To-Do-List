//
//  ToDoListItemViewModel.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject{
    
    
    func toggleIsItemDone(item: ToDoListItemModel){
        var itemCopy = item
        itemCopy.setDone(state: !item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection(NetworkPath.user.rawValue)
            .document(uid)
            .collection(NetworkPath.todos.rawValue)
            .document(item.id)
            .setData(itemCopy.asDictionary())
        
    }
    
}
