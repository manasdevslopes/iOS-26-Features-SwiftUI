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

struct StartTab: View {
    @State private var selectedTab = MyTabs.basic
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: .basic) {
                TheBasicsView()
            }
            Tab(value: .nonUniform) {
                NonUniformConcentric()
            }
            Tab(value: .contentShape) {
               ContentShapeView()
            }
            Tab(value: .sheetPresentation) {
               SheetPresentation()
            }
            Tab(value: .clippedImages) {
                ClippedConcentricImages()
            }
            Tab(value: .bonus) {
                TiledImagesView()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .ignoresSafeArea()
        .safeAreaInset(edge: .top, alignment: .trailing) {
            Menu {
                Picker("Select Tab", selection: $selectedTab) {
                    ForEach(MyTabs.allCases) { tab in
                        Button(tab.title) {
                            selectedTab = tab
                        }
                    }
                }
            } label: {
                Image(systemName: "ellipsis")
                    .font(.title)
                    .padding(5)
                    
            }
            .glassEffect(.regular)
//            .padding()
            .offset(x: -10, y: -15)
        }
    }
}

#Preview {
    StartTab()
}

enum MyTabs: Hashable, CaseIterable, Identifiable {
    case basic, nonUniform, contentShape, sheetPresentation, clippedImages, bonus
    var id: Self { self }
    var title: String {
        switch self {
        case .basic:
            "The Basic"
        case .nonUniform:
            "Non Uniform Concentric Corners"
        case .contentShape:
            "Content Shapes"
        case .sheetPresentation:
            "Sheet Presentation"
        case .clippedImages:
            "Clipped Concentric Images"
        case .bonus:
            "Bonus: Tiled Images"
        }
    }

}
