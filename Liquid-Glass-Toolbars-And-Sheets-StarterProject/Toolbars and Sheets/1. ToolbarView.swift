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

struct ToolbarView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationStack {
      Image(.toolbarBitMoji)
        .resizable()
        .scaledToFit()
        .padding()
        .navigationTitle("Toolbar Placements")
        .navigationSubtitle("Symentic toolbar placements")
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button("Cancel", systemImage: "xmark") {
              dismiss()
            }
          }
          
          ToolbarItem(placement: .principal) {
            Text("Symentic")
          }
          
          ToolbarItem(placement: .subtitle) {
            Text("Subtitle too")
          }
          
//          ToolbarItem(placement: .largeSubtitle) {
//            Text("Subtitle too")
//          }
          
          ToolbarItem(placement: .destructiveAction) {
            Button("Delete", systemImage: "trash") {
              
            }
            .tint(.red)
          }
          
          ToolbarItem(placement: .confirmationAction) {
            Button("Done", systemImage: "checkmark") {
              dismiss()
            }
          }
        }
    }
  }
}

#Preview {
  ToolbarView()
}
