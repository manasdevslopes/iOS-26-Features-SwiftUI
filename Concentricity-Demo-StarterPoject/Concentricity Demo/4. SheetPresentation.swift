//
//----------------------------------------------
// Original project: Concentricity Demo
// by  Stewart Lynch on 2025-08-25
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

struct SheetPresentation: View {
  @State private var showSheet = false
  @State private var showPopOver = false
  var body: some View {
    NavigationStack {
      Text("Tap For more info!")
        .onTapGesture {
          showPopOver.toggle()
        }
        .navigationTitle("Presentations")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItemGroup(placement: .primaryAction) {
            Button("Sheet") {
              showSheet.toggle()
            }
          }
        }
        .sheet(isPresented: $showSheet) {
          ConcentricRectangle()
            .fill(.blue.gradient)
            .padding()
            .ignoresSafeArea()
            .presentationDetents([.medium])
        }
        .popover(isPresented: $showPopOver) {
          Color.yellow
            .clipShape(ConcentricRectangle(corners: .concentric, isUniform: true))
            .padding()
            .frame(width: 200, height: 200)
            .presentationCompactAdaptation(.popover)
        }
    }
  }
}

#Preview {
  SheetPresentation()
}
