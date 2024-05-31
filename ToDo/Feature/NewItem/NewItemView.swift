//
//  NewItemVİew.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI


struct NewItemView: View {
    
    @Binding var newItemPresented: Bool
    
    @State var newItemVM = NewItemViewModel()
    
    var body: some View {
        VStack{
            Text("New Task")
                .asText(size: FontSizes.largeTitle, weight: .bold)
                .padding(.top, ViewSize.paddingStackLow)
            Form{
                TextField("Title", text: $newItemVM.title)
                DatePicker("Due Date", selection: $newItemVM.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                NormalButton(onTap: {
                    newItemVM.save()
                    newItemPresented = newItemVM.newItemPresented
                }, title: "Save")
            }.alert(isPresented: $newItemVM.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please check the accuracy of the data")
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
