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
    
    public init(node: String) throws {
        self.node = node
    }
    
    public var body: some View {
        VStack {
            GeometryReader { proxy in
                SpriteContainerView(proxy: proxy, node: node)
            }
            .frame(alignment: .center)
        }

        .edgesIgnoringSafeArea(.all)
    }
}

struct ParticleView_Previews: PreviewProvider {
    static var previews: some View {
        try! ParticleView(node: "Fire2")
    }
}
