//
//----------------------------------------------
// Original project: Liquid Glass Other Controls
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

struct OtherControls: View {
  @State private var toggleOn: Bool = false
  
  enum Mode: String, CaseIterable {
    case light, dark
  }
  @State private var selectedMode: Mode = .light
  @State private var sliderValue: Double = 0.0
  
  let range = 0.0...10.0
  let step = 1.0
  
  var body: some View {
    NavigationStack {
      Form {
        // Toggle
        Toggle("Toggle", isOn: $toggleOn)
        
        LabeledContent("Segmented Control") {
          Picker("Segmented Control", selection: $selectedMode) {
            ForEach(Mode.allCases, id: \.self) { mode in
              Text(mode.rawValue)
            }
          }
          .pickerStyle(.segmented)
        }
        
        Section("Sliders and Ticks") {
          LabeledContent("Slider 0") {
            VStack {
              Slider(value: $sliderValue, in: range, step: step, label: {})
              Text(sliderValue, format: .number.precision(.fractionLength(0)))
            }
          }
          
          LabeledContent("Slider 1") {
            VStack {
              Slider(value: $sliderValue, in: range, step: step)
              Text(sliderValue, format: .number.precision(.fractionLength(0)))
            }
          }
          LabeledContent("Slider 2") {
            VStack {
              Slider(value: $sliderValue, in: range) {
                Text("Slider with ticks")
              } ticks: {
                SliderTick(0)
                SliderTick(5)
                SliderTick(10)
              }
              Text(sliderValue, format: .number.precision(.fractionLength(0)))
            }
          }
          
          LabeledContent("Slider 3") {
            VStack {
              Slider(value: $sliderValue, in: range) {
                Text("Slider with ticks")
              } ticks: {
                SliderTickContentForEach(stride(from: 0, through: 10, by: 1).map { $0 }, id: \.self) { value in
                  SliderTick(value) {
                    Text(String(format: "%.0f", value))
                  }
                }
              }
              Text(sliderValue, format: .number.precision(.fractionLength(0)))
            }
          }
        }
      }
      .navigationTitle("Liquid Glass Controls")
      .toolbarTitleDisplayMode(.inlineLarge)
    }
  }
}

#Preview {
  OtherControls()
}
