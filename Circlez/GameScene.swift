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
        setUpGLobalPropertiesForGame()
        entityManager = EntityManager(scene: self)
        entityManager.setUpANewGame()
    }
    
    func setUpGLobalPropertiesForGame() {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if nodeA?.name == "left-wall" {
            nodeB?.physicsBody!.applyImpulse(CGVector(dx: 0.0001, dy: 0.0))
            print("hit left")
        }
        if nodeA?.name == "right-wall" {
            nodeB?.physicsBody!.applyImpulse(CGVector(dx: -0.0001, dy: 0.0))
            print("hit right")
        }
        if nodeA?.name == "top-wall" {
            nodeB?.physicsBody!.applyImpulse(CGVector(dx: 0.0, dy: -0.0001))
            print("hit top")
        }
        if nodeA?.name == "bottom-wall" {
            nodeB?.physicsBody!.applyImpulse(CGVector(dx: 0.0, dy: 0.0001))
            print("hit bottom")
        }
    }
    
    
    
}



