//
//  ToDoListItemView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var todoListItemVM = ToDoListItemViewModel()
    let item: ToDoListItemModel
    
    var body: some View {

        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .asText(size: FontSizes.headline, weight: .bold)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                todoListItemVM.toggleIsItemDone(item: item)
            }, label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle"
                )
                .foregroundStyle(.blue)
            })
        }
        
    }
}

#Preview {
    ToDoListItemView(item: 
            .init(
                title: "Swift",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false
            )
    )
}
