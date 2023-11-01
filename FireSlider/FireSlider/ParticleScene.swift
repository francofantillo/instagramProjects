//
//  ParticleScene.swift
//  FireAndWater
//
//  Created by Franco Fantillo on 2023-09-15.
//

import Foundation
import SpriteKit
import SwiftUI

class ParticleScene: SKScene {
    
    var node: String
    var percent: Binding<Float>
    private var emitter: SKEmitterNode
    
    init(size: CGSize, node: String, percent: Binding<Float>) {
        self.node = node
        self.percent = percent
        self.emitter = SKEmitterNode(fileNamed: node)!
        super.init(size: size)
        backgroundColor = .clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        startNode()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if percent.wrappedValue > 20 {
            emitter.particleSpeed = CGFloat(percent.wrappedValue/100 * 200)
        } else {
            emitter.particleSpeed = 100
        }
        
        emitter.particlePositionRange.dx = CGFloat(percent.wrappedValue/100 * 200)
        emitter.particleBirthRate = CGFloat((percent.wrappedValue/100) * 900)
    }
    
    func startNode() {
        emitter.position = CGPoint(x: size.width / 2, y: size.height / 2)
        emitter.particlePositionRange = CGVector(dx: size.width / 4, dy: 5)
        
        if percent.wrappedValue > 20 {
            emitter.particleSpeed = CGFloat(percent.wrappedValue/100 * 200)
        } else {
            emitter.particleSpeed = 100
        }
        
        emitter.particlePositionRange.dx = CGFloat(percent.wrappedValue/100 * 200)
        emitter.particleBirthRate = CGFloat((percent.wrappedValue/100) * 900)
        addChild(emitter)
    }
}
