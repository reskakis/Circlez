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
    var balls = [BallEntity]()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }

    func setUpANewGame() {
        //To do: (make a ball color chooser at some point)
        
        let initialEntity: BallEntity = BallEntity()
        entities.insert(initialEntity)
        
        if let ballNode = initialEntity.component(ofType: BallConfigComponent.self)?.ball {
            scene.addChild(ballNode)
            ballNode.physicsBody!.applyImpulse(CGVector(dx: 10.0, dy: 10.0))
        }
    }
}

