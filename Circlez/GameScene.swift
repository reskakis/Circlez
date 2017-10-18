//
//  GameScene.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/8/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var entityManager: EntityManager!
    var i = 0;
    
    override func sceneDidLoad() {
        
    }
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        setUpGLobalPropertiesForGame()
        entityManager.setUpANewGame()
    }
    
    func setUpGLobalPropertiesForGame() {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        borderBody.angularDamping = 0
        borderBody.linearDamping = 0
        borderBody.restitution = 1
        borderBody.friction = 0
        borderBody.affectedByGravity = false
        borderBody.allowsRotation = false
        physicsWorld.contactDelegate = self

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let node = contact.bodyA.node!
        let nodeB = contact.bodyB.node!
        if node.name != "ball" {
            let strength = 1.0 * (nodeB.position.x < frame.width / 2 ? 1 : -1)
            print(nodeB.position.x)
            print(frame.width / 2)
            print(strength)
            nodeB.physicsBody!.applyImpulse(CGVector(dx: strength, dy: 0))

            print("elephant")
        }
    }
}



