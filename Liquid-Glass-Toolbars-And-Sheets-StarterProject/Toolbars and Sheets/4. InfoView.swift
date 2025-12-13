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

struct InfoView: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    NavigationStack {
      ScrollView {
        Text(
    """
    In suscipit aliquid. Sint iure adipisci corrupti labore consequatur dolor. Dolores corrupti voluptatum perferendis dolorem omnis ab qui sit distinctio. Est molestiae ipsum ab esse nulla et qui reprehenderit voluptatibus. Dolores odio ut.
    
    Deserunt aliquid asperiores et quos. Quae voluptas debitis deserunt. Inventore dolor non hic sunt quod ex molestias tempora. Quo corporis sapiente sapiente est. Ut explicabo ut blanditiis ea quibusdam.
    
    Alias sed dolor quia. Et doloribus sunt quaerat molestias aperiam magnam sunt. Qui sequi qui consectetur quo est est quo est et. Amet ut repellat.
    
    Itaque distinctio non ex. Libero nostrum tempore quaerat. Dolor odio fuga deleniti harum. Ut sequi aut aliquam laborum ipsum aut cum dignissimos. Sit illum ea dolores expedita ullam corporis et vitae. Doloribus molestiae ut ut voluptatem et suscipit.
    
    Et molestiae doloremque at in eveniet voluptatem architecto voluptatum. Enim et qui laudantium quasi tempore maxime alias laudantium. Repellat ut asperiores explicabo qui et. Repellendus repudiandae
    """
        )
      }
      .padding()
      .navigationTitle("Info")
      .navigationBarTitleDisplayMode(.inline)
      .ignoresSafeArea(edges: .bottom)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel", systemImage: "xmark") {
            dismiss()
          }
        }
      }
    }
    .scrollBounceBehavior(.basedOnSize)
  }
}

#Preview {
  InfoView()
}
