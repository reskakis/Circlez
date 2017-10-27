//
//  ImageComponent.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/10/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class BallConfigComponent: GKComponent {
    
    let testBall: SKShapeNode
    
    override init() {
        testBall = SKShapeNode(circleOfRadius: 20)
        testBall.physicsBody = SKPhysicsBody(circleOfRadius: testBall.frame.size.width/2)
        testBall.physicsBody!.restitution = 1.0
        testBall.physicsBody!.friction = 0.0
        testBall.physicsBody!.angularDamping = 0.0
        testBall.physicsBody!.linearDamping = 0.0
        testBall.physicsBody!.applyImpulse(CGVector(dx: 25.0, dy: 20.0))
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
