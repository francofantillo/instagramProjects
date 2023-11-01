//
//  SceneView.swift
//  Bouncing Ball
//
//  Created by Franco Fantillo on 2023-10-27.
//

import Foundation
import SceneKit

class SceneView: SCNView {
    
    var sphere: SCNNode!
    
    override func willMove(toSuperview newSuperview: UIView?) {
        
        backgroundColor = UIColor.clear // this is key!
        allowsCameraControl = true
        autoenablesDefaultLighting = true
        sphere = self.scene!.rootNode.childNode(withName: "sphere", recursively: true)!
        isPlaying = true
    }
}
