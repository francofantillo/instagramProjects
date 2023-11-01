//
//  SpriteContainerView.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI
import SpriteKit

struct SpriteContainerView: View {
    
    var proxy: GeometryProxy
    var node: String
    
    var body: some View {
        SpriteView(
            scene: createScene(of: proxy.size),
            options: [.allowsTransparency]
        )
    }
    
    private func createScene(of size: CGSize) -> SKScene {
        return ParticleScene(size: size, node: node)
    }
}
