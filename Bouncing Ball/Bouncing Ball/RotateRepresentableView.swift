//
//  RotateRepresentableView.swift
//  LightHouse2
//
//  Created by Franco Fantillo on 2023-09-20.
//

import SwiftUI
import SceneKit

struct RotateRepresentableView: UIViewRepresentable {
    
    typealias UIViewType = SceneView
    typealias Context = UIViewRepresentableContext<RotateRepresentableView>
    
    let sceneView: SceneView!
    @Binding var toggleBinding: Bool
    
    class SceneCoordinator: NSObject, SCNPhysicsContactDelegate {
        
        let parent: SceneView
        @Binding var toggle: Bool
        
        init(parent: SceneView, toggleBinding: Binding<Bool>) {
            self.parent = parent
            self._toggle = toggleBinding
            super.init()
        }

        func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
            parent.sphere.physicsBody?.applyForce(SCNVector3(x: 0, y: 20, z: 0), asImpulse: true)
            toggle.toggle()
        }
    }

    init(toggleBinding: Binding<Bool>) {
        self.sceneView = SceneView()
        self._toggleBinding = toggleBinding
    }
    
    func makeCoordinator() -> SceneCoordinator {
        
        SceneCoordinator(parent: sceneView, toggleBinding: $toggleBinding)
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
    func makeUIView(context: Context) -> UIViewType {
        
        sceneView.scene = SCNScene(named: "ball.scn")!
        sceneView.scene?.physicsWorld.contactDelegate = context.coordinator
        return sceneView
    }
}



#Preview {
    RotateRepresentableView(toggleBinding: .constant(true))
}
