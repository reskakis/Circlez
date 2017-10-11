//
//  EntityManager.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/10/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager {
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        if let ballNode = entity.component(ofType: BallConfigComponent.self)?.testBall{
           
            scene.addChild(ballNode)
            ballNode.physicsBody!.applyImpulse(CGVector(dx: 25.0, dy: 20.0))

        }
    }
}
