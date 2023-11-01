//
//  ParticleView.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI
import SpriteKit

struct ParticleView: View {
    
    private var node: String
    
    private var percent: Binding<Float>
    
    public init(node: String, percent: Binding<Float>) throws {
        self.node = node
        self.percent = percent
    }
    
    public var body: some View {
        VStack {
            GeometryReader { proxy in
                SpriteContainerView(proxy: proxy, node: node, percent: percent)
            }
            .frame(alignment: .center)
        }

        .edgesIgnoringSafeArea(.all)
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        try! ParticleView(node: "Fire2", percent: .constant(50))
    }
}
