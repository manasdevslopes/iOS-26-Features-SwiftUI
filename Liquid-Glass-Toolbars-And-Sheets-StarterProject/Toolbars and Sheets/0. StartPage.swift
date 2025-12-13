//
//----------------------------------------------
// Original project: Toolbars and Sheets
// by  Stewart Lynch on 2025-07-27
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2025 CreaTECH Solutions. All rights reserved.


import SwiftUI

enum TargetPage: Identifiable, View {
  case toolbar, toolbar2, sheet
  var id: Self { self }
  var body: some View {
    switch self {
      case .toolbar:
        ToolbarView()
      case .toolbar2:
        ToolbarView2()
      case .sheet:
        Info_Sheet()
    }
  }
}

struct StartPage: View {
  @State private var selectedPage: TargetPage?
  @State private var openSheet: Bool = false
  
  var body: some View {
    NavigationStack {
      VStack{
        Image(.toolbarBitMoji)
          .resizable()
          .scaledToFit()
          .padding()
        Button("Navigation Toolbar") {
          selectedPage = .toolbar
        }
        .tint(.red)
        Button("Navigation Toolbar 2") {
          selectedPage = .toolbar2
        }
        .tint(.green)
        Button("Sheet Presentation") {
          selectedPage = .sheet
        }
        .tint(.blue)
        
        Button("Sheet Presentation") {
          openSheet = true
        }
        .tint(.orange)
      }
      .buttonStyle(.glass)
      .navigationTitle("Toolbars and Sheets")
      .sheet(isPresented: $openSheet) {
        Image(.toolbarBitMoji)
          .resizable()
          .scaledToFit()
          .padding()
          .navigationTitle("Sheets")
          .presentationDetents([.medium, .large])
      }
      .fullScreenCover(item: $selectedPage) { presentedView in
        presentedView
      }
    }
  }
}

#Preview {
  StartPage()
}
