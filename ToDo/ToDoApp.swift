//
//  ToDoApp.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
