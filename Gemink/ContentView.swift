//
//  ContentView.swift
//  Gemink
//
//  Created by Abrar Wiryawan on 20/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchGamesView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person")
                }
        }
        .navigationBarTitleTextColor()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
