//
//----------------------------------------------
// Original project: Concentricity Demo
// by  Stewart Lynch on 2025-08-26
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

struct ContentShapeView: View {
    @State private var padding = 10.0
    @State private var containerRadius = 0.0
    var body: some View {
        VStack {
           // Concentric Rectangle
          ConcentricRectangle()
            .fill(.red.gradient)
            .padding(padding)
            .frame(height: 200)
            .background(.black)
            .containerShape(.rect(cornerRadius: containerRadius))
            .padding()

            VStack {
                Slider(value: $containerRadius, in: 0...100)
                Text("containerRadius")
            }
            .padding()
            VStack {
                Slider(value: $padding, in: 0...100)
                Text("padding")
            }
            .padding()
            // Clipped Color
          Color.cyan
            .clipShape(ConcentricRectangle())
            .padding(padding)
            .frame(height: 200)
            .background(.black)
            .containerShape(.capsule)
            .padding()
        }
    }
}

#Preview {
    ContentShapeView()
}
