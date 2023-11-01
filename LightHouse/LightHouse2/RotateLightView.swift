//
//  ContentView.swift
//  LightHouse2
//
//  Created by Franco Fantillo on 2023-09-20.
//

import SwiftUI
import SceneKit

struct RotateLightView: View {

    private let scene:  SCNScene
    private let coneNode: SCNNode
    private let cylinderNode: SCNNode
    private let cameraNode: SCNNode
    
    init() {
        scene = SCNScene(named: "lightBeam.scn")!
        coneNode = scene.rootNode.childNode(withName: "cone", recursively: true)!
        cylinderNode = scene.rootNode.childNode(withName: "cylinder", recursively: true)!
        cameraNode = scene.rootNode.childNode(withName: "camera", recursively: true)!
        addAnimation(node: coneNode)
        edgePivot(for: coneNode)
    }
    
    var body: some View {
        
        ZStack {
            SceneView(scene: scene, pointOfView: cameraNode)
                .ignoresSafeArea(.all)
        }
    }
    
    func addAnimation(node: SCNNode) {
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5.0)
        let repeatAction = SCNAction.repeatForever(rotateOne)
        node.runAction(repeatAction)
    }
    
    func edgePivot(for node: SCNNode) {
        node.pivot = SCNMatrix4MakeTranslation(0, 0.5, 0)
   }
}

#Preview {
    RotateLightView()
}
