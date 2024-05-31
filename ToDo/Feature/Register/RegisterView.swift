//
//  RegisterView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

private let frameSize = 300.0

struct RegisterView: View {
    
    @StateObject var registerVM = RegisterViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                HeaderView()
                Form(){
                    
                    Section(header: Text("Register Formu")) {
                        if !registerVM.errorMessage.isEmpty{
                            Text(registerVM.errorMessage)
                                .foregroundStyle(.red)
                        }
                        TextField("Full Name", text: $registerVM.name)
                            .autocorrectionDisabled()
                        TextField("Email Address", text: $registerVM.email)
                            .textInputAutocapitalization(.never)
                        SecureField("Password", text: $registerVM.password)
                    }
                }.textFieldStyle(DefaultTextFieldStyle())
                    .frame(height: frameSize)
                
                NormalButton(onTap: {
                    registerVM.register()
                }, title: "Register")
                .padding(.horizontal)
                
                Spacer()
                
                VStack{
                    Spacer()
                    Text("Are you already one of us?")
                    Spacer()
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Login!")
                    }
                }.padding(.bottom, ViewSize.paddingStackNormal)
            }
            
        }
    }
}

#Preview {
    RegisterView()
}
