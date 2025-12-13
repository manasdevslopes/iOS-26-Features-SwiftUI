//
// ContentView.swift
// iOS26_Flow_Writes_Codes
//
// Created by MANAS VIJAYWARGIYA on 12/12/25.
// ------------------------------------------------------------------------
// Copyright © 2025 Blacenova. All rights reserved.
// ------------------------------------------------------------------------
//


import SwiftUI

enum Tabs: String {
  case home, profile, settings, search
}

struct ContentView: View {
  // @State private var selectedTab: Tabs = .home
  @AppStorage("selectedTab") private var selectedTab: Tabs = .home
  @State private var searchString: String = ""
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Tab("Home", systemImage: "house", value: .home) {
        Color.yellow.opacity(0.8).ignoresSafeArea()
      }
      
      Tab("Profile", systemImage: "person", value: .profile) {
        Color.orange.ignoresSafeArea()
      }
      
      Tab("Settings", systemImage: "gear", value: .settings) {
        Color.gray.opacity(0.8).ignoresSafeArea()
      }
      
      Tab(value: .search, role: .search) {
        NavigationStack {
          List {
            Text("Search Screen")
          }
          .navigationTitle("Search")
          .searchable(text: $searchString)
        }
      }
    }
    .tabViewBottomAccessory {
      Text("Hello from the SwiftUI's TabView Bottom Accessory")
    }
  }
}

#Preview {
  ContentView()
}
