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
    
    var entityManager: EntityManager!
   
    override func sceneDidLoad() {
        SKPhysicsContact.bod
        
    }
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        setUpGLobalPropertiesForGame()
        entityManager.setUpANewGame()
    }
 
    func setUpGLobalPropertiesForGame() {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
    }
    
    
}
