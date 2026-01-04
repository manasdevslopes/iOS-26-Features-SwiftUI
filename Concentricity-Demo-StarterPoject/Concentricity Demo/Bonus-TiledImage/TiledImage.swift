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
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
typealias PlatformImage = UIImage
#elseif os(macOS)
import AppKit
typealias PlatformImage = NSImage
#endif

struct TiledImage: View {
  @State private var images: [Image] = []
  let rows: Int
  let cols: Int
  var spacing: CGFloat
  let resource: ImageResource?
  let url: URL?
  init(resource: ImageResource, rows: Int, cols: Int, spacing: CGFloat = 10) {
    self.rows = rows
    self.cols = cols
    self.spacing = spacing
    self.resource = resource
    self.url = nil
  }
  init(url: URL, rows: Int, cols: Int, spacing: CGFloat = 5) {
    self.rows = rows
    self.cols = cols
    self.spacing = spacing
    self.resource = nil
    self.url = url
  }
  var body: some View {
    let grid = Array(repeating: GridItem(.flexible(), spacing: spacing), count: cols)
    LazyVGrid(columns: grid, spacing: spacing) {
      ForEach(images.indices, id: \.self) { i in
        images[i]
          .resizable()
          .scaledToFit()
      }
    }
    .clipShape(ConcentricRectangle())
    .containerShape(.rect(cornerRadius: 40))
    .ignoresSafeArea()
    .onAppear {
      if let resource {
        self.images = tiledImages(resource: resource, rows: rows, cols: cols)
      }
      if let url = self.url {
        Task {
          self.images = try await tiledImages(from: url, rows: rows, cols: cols)
        }
      }
    }
  }
  
  // MARK: - Tile an image into rows × cols
  private func tileImage(_ image: PlatformImage, rows: Int, cols: Int) -> [PlatformImage] {
    precondition(rows > 0 && cols > 0, "rows/cols must be > 0")
    guard let cg = normalizedCGImage(from: image) else { return [] }
    
    // Make dimensions divisible to avoid 1px seams
    let w = cg.width  - (cg.width  % cols)
    let h = cg.height - (cg.height % rows)
    let tileW = w / cols
    let tileH = h / rows
    
    var tiles: [PlatformImage] = []
    tiles.reserveCapacity(rows * cols)
    
    for r in 0..<rows {
      for c in 0..<cols {
        let rect = CGRect(x: c * tileW, y: r * tileH, width: tileW, height: tileH)
        guard let piece = cg.cropping(to: rect) else { continue }
#if os(iOS) || os(tvOS) || os(watchOS)
        tiles.append(UIImage(cgImage: piece, scale: 1, orientation: .up))
#else
        tiles.append(NSImage(cgImage: piece, size: .zero))
#endif
      }
    }
    return tiles
  }
  
  // MARK: - Public async helper: download → tile → SwiftUI Images
  private func tiledImages(from url: URL, rows: Int, cols: Int) async throws -> [Image] {
    let (data, _) = try await URLSession.shared.data(from: url)
#if os(iOS) || os(tvOS) || os(watchOS)
    guard let base = PlatformImage(data: data) else { return [] }
    return tileImage(base, rows: rows, cols: cols).map { Image(uiImage: $0) }
#else
    guard let base = PlatformImage(data: data) else { return [] }
    return tileImage(base, rows: rows, cols: cols).map { Image(nsImage: $0) }
#endif
  }
  // Convenience: load from asset resource and return SwiftUI Images
  private func tiledImages(resource: ImageResource, rows: Int, cols: Int) -> [Image] {
#if os(iOS) || os(tvOS) || os(watchOS)
    let base = UIImage(resource: resource)
    return tileImage(base, rows: rows, cols: cols).map { Image(uiImage: $0) }
#else
    let base = NSImage(resource: resource)
    return tileImage(base, rows: rows, cols: cols).map { Image(nsImage: $0) }
#endif
  }
  
  // MARK: - Orientation normalization so crops are correct
  private func normalizedCGImage(from image: PlatformImage) -> CGImage? {
#if os(iOS) || os(tvOS) || os(watchOS)
    if let cg = image.cgImage, image.imageOrientation == .up { return cg }
    let size = image.size
    let fmt = UIGraphicsImageRendererFormat.default()
    fmt.scale = 1
    let rendered = UIGraphicsImageRenderer(size: size, format: fmt).image { _ in
      image.draw(in: CGRect(origin: .zero, size: size))
    }
    return rendered.cgImage
#else
    var rect = CGRect(origin: .zero, size: image.size)
    return image.cgImage(forProposedRect: &rect, context: nil, hints: nil)
#endif
  }
}

#Preview("Asset") {
  TiledImage(resource: .lahaina, rows: 8, cols: 4, spacing: 2)
}

#Preview("URL") {
  let url = URL(string: "https://picsum.photos/300/600")!
  TiledImage(url: url, rows: 2, cols: 3)
}
