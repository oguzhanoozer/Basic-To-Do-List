//
//  ProfileView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

private let frameSize = 125.0

struct ProfileView: View {
    
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let user = profileVM.user{
                    profileView(user: user)
                }else{
                    Text("Profile Loading...")
                }
                
                NormalButton(onTap: {
                    profileVM.signOut()
                }, title: "Sign Out")
                .padding(.horizontal)
                
            }.navigationTitle("Profile")
        }
        .onAppear{
            profileVM.fetchUser()
        }
    }
    
    @ViewBuilder
    func profileView(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.blue)
            .frame(width: frameSize,height: frameSize)
        
        VStack{
            HStack{
                Text("Name: ")
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                Text(user.email)
            }
            HStack{
                Text("Registration Data: ")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
