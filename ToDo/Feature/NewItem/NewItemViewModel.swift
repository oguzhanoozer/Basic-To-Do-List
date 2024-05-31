//
//  NewItemViewModel.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var newItemPresented = true
    
    
    func save(){
        guard canSave else {
            showAlert = true
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        newItemPresented = false
        saveTaskItem(uid: uId)
        
    }
    
    func saveTaskItem(uid: String){
        
        let newTaskItem = ToDoListItemModel(
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        let db = Firestore.firestore()
        db.collection(NetworkPath.user.rawValue)
            .document(uid)
            .collection(NetworkPath.todos.rawValue)
            .document(newTaskItem.id)
            .setData(newTaskItem.asDictionary())
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false;
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
    
}
