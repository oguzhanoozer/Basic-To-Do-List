//
//  RegisterViewModel.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
        
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            self?.saveUserRecord(id: userId)
        }
        
    }
    
    func saveUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection(NetworkPath.user.rawValue)
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validate() -> Bool{
        
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email address"
            return false
        }
        
        guard password.count  >= 6 else{
            errorMessage = "Please set a password of 6 or more characters"
            return false
        }
        return true
        
    }
}
