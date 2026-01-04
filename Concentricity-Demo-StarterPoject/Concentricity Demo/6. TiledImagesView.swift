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

struct TiledImagesView: View {
  var body: some View {
    let url = URL(string: "https://picsum.photos/200/300")!
    ScrollView {
      // Tiled Images
      TiledImage(resource: .petals, rows: 8, cols: 4, spacing: 5)
      TiledImage(url: url, rows: 7, cols: 4)
    }
    .padding()
  }
}

#Preview {
  TiledImagesView()
}
