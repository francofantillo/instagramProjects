//
//  ContentView.swift
//  SceneTest
//
//  Created by Franco Fantillo on 2023-09-19.
//

import SwiftUI
import SceneKit

struct PlanetView: View {

    private let scene = PlanetScene()
    private let cameraNode = createCameraNode()
    
    var body: some View {
        
        ZStack {
            SceneView(scene: scene, pointOfView: cameraNode)
                .ignoresSafeArea(.all)
            try! ParticleView(node: "Fire2")
                .frame(width: 200, height: 200)
                .offset(x: 100, y: -350)
        }

    }

    static func createCameraNode() -> SCNNode {
       let cameraNode = SCNNode()
       cameraNode.camera = SCNCamera()
       return cameraNode
    }
}

#Preview {
    PlanetView()
}
