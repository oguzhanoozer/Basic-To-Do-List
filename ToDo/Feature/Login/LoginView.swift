//
//  LoginView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

private let frameSize = 200.0

struct LoginView: View {
    
    @StateObject var loginVM = LoginViewModel()
    
    var body: some View {
        
        NavigationStack {
            VStack{
                HeaderView()
                Form{
                    if !loginVM.errorMessage.isEmpty{
                        Text(loginVM.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address", text: $loginVM.email)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $loginVM.password)
                }
                .textFieldStyle(DefaultTextFieldStyle())
                .frame(height: frameSize)
                NormalButton(onTap: {
                    loginVM.login()
                }, title: "Login")
                .padding(.horizontal)
                Spacer()
                
                VStack{
                    Text("New around here")
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create An Account!")
                    }
                }.padding(.bottom, ViewSize.paddingStackNormal)
            }
        }
        
    }
    
}

#Preview {
    LoginView()
}
