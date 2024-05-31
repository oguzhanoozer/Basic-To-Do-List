//
//  ToDoListItemModel.swift
//  ToDo
//
//  Created by oguzhan on 31.05.2024.
//

import Foundation

struct ToDoListItemModel: Codable, Identifiable{
    var id = UUID().uuidString
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(state: Bool){ // (_ state: Bool)
        isDone = state
    }
}
