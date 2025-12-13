//
//----------------------------------------------
// Original project: Toolbars and Sheets
// by  Stewart Lynch on 2025-07-29
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

struct ToolbarView2: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationStack {
      Image(.toolbarBitMoji)
        .resizable()
        .scaledToFit()
        .padding()
        .navigationTitle("More Placements")
        .navigationSubtitle("Groupings, Spacers and Bottom Bars")
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Cancel", systemImage: "xmark") {
              dismiss()
            }
          }
          ToolbarSpacer(.fixed, placement: .topBarLeading)
          ToolbarItem(placement: .topBarLeading) {
            Button("Help", systemImage: "questionmark") { }
          }
          
          ToolbarItemGroup(placement: .topBarTrailing) {
            Button("Draw", systemImage: "pencil") { }
            Button("Erase", systemImage: "eraser") { }
          }
          ToolbarSpacer(.fixed, placement: .topBarTrailing)
          ToolbarItem(placement: .topBarTrailing) {
            Button("info", systemImage: "info") { }
          }
          
          ToolbarItem(placement: .bottomBar) {
            Button("Delete", systemImage: "trash") { }
          }
          ToolbarSpacer(.flexible, placement: .bottomBar)
          ToolbarItem(placement: .bottomBar) {
            Button("New", systemImage: "plus") { }
          }
          
        }
    }
  }
}

#Preview {
  ToolbarView2()
}
