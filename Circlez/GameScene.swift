//
//  GameScene.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/8/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var entities = [GKEntity]()
    
    override func sceneDidLoad() {
     
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)

        let testBall = SKShapeNode(circleOfRadius: 20)
        self.addChild(testBall)

        testBall.physicsBody = SKPhysicsBody(circleOfRadius: testBall.frame.size.width/2)
        testBall.physicsBody!.restitution = 1.0
        testBall.physicsBody!.friction = 0.0
        testBall.physicsBody!.angularDamping = 0.0
        testBall.physicsBody!.linearDamping = 0.0
       
        testBall.physicsBody!.applyImpulse(CGVector(dx: 10.0, dy: 10.0))
        
       
    }

}
