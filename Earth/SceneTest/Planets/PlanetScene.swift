//
//  PlanetScene.swift
//  SceneTest
//
//  Created by Franco Fantillo on 2023-09-19.
//

import Foundation
import SceneKit
import CoreMotion

class PlanetScene: SCNScene {
    
    private var planetNode: SCNNode
    private let motionManager = CMMotionManager()

    override init() {
        
        planetNode = PlanetScene.createPlanetNode()
        super.init()
        addBackground()
        addPlanetNode()
        addStars()
        configureCamera()
        addOmniLight()
        addPlanetRotation()
        addAnimation(node: planetNode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCamera() {
        self.rootNode.position = SCNVector3(x: 0, y: 0, z: -8)
    }
    
    func addBackground() {
        background.contents = UIColor.black
    }
    
    private static func createPlanetNode() -> SCNNode {
        let planetMaterial = SCNMaterial()
        planetMaterial.diffuse.contents = UIImage(named: "earth")
           
        let planetGeometry = SCNSphere(radius: 1)
        planetGeometry.materials = [planetMaterial]

        let planetNode = SCNNode(geometry: planetGeometry)
        planetNode.position = SCNVector3(0, 0, 0)
        return planetNode

    }
    
    func addPlanetNode() {
        
        self.rootNode.addChildNode(planetNode)
    }
    
    func addStars() {
        let stars = SCNParticleSystem(named: "StarsParticles.scnp", inDirectory: nil)!
        
        self.rootNode.addParticleSystem(stars)
    }
    
    func addOmniLight() {
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        
        omniLightNode.light?.type = SCNLight.LightType.omni
        omniLightNode.light?.color = UIColor(white: 1, alpha: 1)
        omniLightNode.position = SCNVector3Make(50, 0, 30)
        
        self.rootNode.addChildNode(omniLightNode)
    }
    
    func addAnimation(node: SCNNode) {
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 5.0)
        let repeatAction = SCNAction.repeatForever(rotateOne)
        node.runAction(repeatAction)
    }
    
    func addPlanetRotation() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] deviceMotion, error in
            guard let attitude = deviceMotion?.attitude else { return }
                        
            self?.planetNode.eulerAngles = SCNVector3(
                x: Float(attitude.pitch),
                y: Float(attitude.roll),
                z: Float(attitude.yaw)
            )
        }
    }
}
