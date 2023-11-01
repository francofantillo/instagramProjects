//
//  RotateRepresentableView.swift
//  LightHouse2
//
//  Created by Franco Fantillo on 2023-09-20.
//

import SwiftUI
import SceneKit

struct RotateRepresentableView: UIViewRepresentable {
    typealias UIViewType = SCNView
    typealias Context = UIViewRepresentableContext<RotateRepresentableView>

    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> UIViewType {
        let view = SCNView()
        view.backgroundColor = UIColor.clear // this is key!
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.scene = SCNScene(named: "lightBeam.scn")!
        
        let coneNode = view.scene!.rootNode.childNode(withName: "cone", recursively: true)!
        addAnimation(node: coneNode)
        edgePivot(for: coneNode)
        
        return view
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
    RotateRepresentableView()
}
