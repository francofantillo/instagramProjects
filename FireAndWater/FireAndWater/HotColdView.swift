//
//  TestView.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI

struct HotColdView: View {
    
    @State var toggle = false
    
    var hotBackground = RadialGradient(colors: [.orange, .clear], center: .center, startRadius: .zero, endRadius: 500)
    
    var coolBackground = RadialGradient(colors: [.blue, .clear], center: .center, startRadius: .zero, endRadius: 500)
    
    var body: some View {
        
        VStack {
            ZStack {
                Circle()
                    .fill(hotBackground)
                    .frame(width: 1000, height: 1000)
                    .opacity(toggle ? 0 : 1)
                Circle()
                    .fill(coolBackground)
                    .frame(width: 1000, height: 1000)
                    .opacity(toggle ? 1 : 0)
                ZStack {
                    try! ParticleView(node: "Fire2")
                        .frame(width: 300)
                        .opacity(toggle ? 0 : 1)
                    
                    ZStack {
                        try! ParticleView(node: "Rain")
                            .frame(width: 150)
                        try! ParticleView(node: "Cloud")
                            .frame(width: 250)
                            .offset(y: -25)
                    }
                    .opacity(toggle ? 1 : 0)
                    
                    HotColdToggle(toggleOn: $toggle)
                        .offset(y: -25)
                        .animation(.easeInOut, value: toggle)
                }
                .onTapGesture {
                    withAnimation {
                        toggle.toggle()
                    }
                }
            }
        }
    }
}

struct HotColdView_Previews: PreviewProvider {
    static var previews: some View {
        HotColdView()
    }
}
