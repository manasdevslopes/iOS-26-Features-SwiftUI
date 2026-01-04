//
// ContentView.swift
// Concentricity_iOS26
//
// Created by MANAS VIJAYWARGIYA on 04/01/26.
// ------------------------------------------------------------------------
//
// ------------------------------------------------------------------------
//


import SwiftUI

struct ContentView: View {
  @State private var isShowingSheet: Bool = false
  
  var body: some View {
    ZStack {
      VStack(alignment: .leading, spacing: 16) {
        // ConcentricRectangle(corners: .concentric(minimum: 12), isUniform: false)
        //          ConcentricRectangle(corners: .concentric, isUniform: true)
        //            .frame(width: 300, height: 300)
        
        Image(.underTheRadar)
          .resizable().frame(width: 300, height: 300)
          .clipShape(.rect(corners: .concentric(), isUniform: true))
        
        VStack(alignment: .leading) {
          Text("Engaging with Reddit").font(.title3.bold())
          Text("Under the Radar").foregroundStyle(.secondary).fontWeight(.semibold)
        }
        
        Button {
          isShowingSheet.toggle()
        } label: {
          Text("Play Episode")
            .font(.title3.bold()).foregroundStyle(.white).padding().background(.indigo)
        }
      }
      .padding(20)
    }
    .background(.secondary.opacity(0.2))
    .containerShape(.rect(cornerRadius: 34, style: .continuous))
    .sheet(isPresented: $isShowingSheet) {
      ConcentricRectangle()
        .fill(.indigo.gradient).padding(20)
        .ignoresSafeArea()
        .presentationDetents([.medium])
    }
  }
}

#Preview {
  ContentView()
}
