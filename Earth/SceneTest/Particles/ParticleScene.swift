//
//  ParticleScene.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import Foundation
import SpriteKit

class ParticleScene: SKScene {
    
    var node: String
    
    init(size: CGSize, node: String) {
        self.node = node
        super.init(size: size)
        
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        startNode()
    }
    
    func startNode() {
        let emitter = SKEmitterNode(fileNamed: node)!
        emitter.position = CGPoint(x: size.width / 2, y: size.height / 2)
        emitter.particlePositionRange = CGVector(dx: size.width / 8, dy: 5)
        addChild(emitter)
    }
}
