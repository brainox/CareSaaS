//
//  MainView.swift
//  CareSaaS
//
//  Created by Obinna on 16/06/2024.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem { 
                    Label("Search", systemImage: "magnifyingglass")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
