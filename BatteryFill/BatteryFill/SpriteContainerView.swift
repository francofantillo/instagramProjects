//
//  SpriteContainerView.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import SwiftUI
import SpriteKit

struct SpriteContainerView: View {
    
    private var proxy: GeometryProxy
    private var node: String
    private var percent: Binding<Float>
    
    init(proxy: GeometryProxy, node: String, percent: Binding<Float>) {
        self.proxy = proxy
        self.node = node
        self.percent = percent
    }
    
    var body: some View {
        SpriteView(
            scene: createScene(of: proxy.size),
            options: [.allowsTransparency]
        )
    }
    
    private func createScene(of size: CGSize) -> SKScene {
        return ParticleScene(size: size, node: node, percent: percent)
    }
}
