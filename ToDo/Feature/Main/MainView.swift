//
//  ContentView.swift
//  ToDo
//
//  Created by oguzhan on 30.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainVM = MainViewModel()
    
    var body: some View {
        
        if mainVM.isSignedIn, !mainVM.currentUserId.isEmpty{
            accountView
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: mainVM.currentUserId)
                .tabItem {
                    Label("Tasks", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
