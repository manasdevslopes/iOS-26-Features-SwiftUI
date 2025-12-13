//
//----------------------------------------------
// Original project: Toolbars and Sheets
// by  Stewart Lynch on 2025-07-30
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

struct Info_Sheet: View {
  @Environment(\.dismiss) var dismiss

  @State private var showInfo: Bool = false
  @Namespace private var infoSpace
  
  var body: some View {
    NavigationStack {
      Image(.toolbarBitMoji)
        .resizable()
        .scaledToFit()
        .padding()
        .navigationTitle("Sheets")
        .toolbarTitleDisplayMode(.inlineLarge)
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Button("Cancel", systemImage: "xmark") {
              dismiss()
            }
          }
          ToolbarSpacer(.fixed, placement: .primaryAction)
          ToolbarItem(placement: .primaryAction) {
            Button("info", systemImage: "info") {
              showInfo.toggle()
            }
          }
          .matchedTransitionSource(id: "info", in: infoSpace)
        }
        .sheet(isPresented: $showInfo) {
          InfoView().presentationDetents([.medium, .large])
            .navigationTransition(.zoom(sourceID: "info", in: infoSpace))
        }
    }
  }
}

#Preview {
  Info_Sheet()
}
