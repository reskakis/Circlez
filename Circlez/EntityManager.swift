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
    
    func addBall(ofColor: UIColor, numberToAdd: Int) {
        for _ in 1...numberToAdd {
            let initialEntity: BallEntity = BallEntity(ofColor: ofColor)
            entities.insert(initialEntity)
            if let ballNode = initialEntity.component(ofType: BallConfigComponent.self)?.ball {
                scene.addChild(ballNode)
                
                ballNode.physicsBody!.applyImpulse(CGVector(dx: EntityManager.randomCGFloat(min: 3.0, max: -3.0), dy: EntityManager.randomCGFloat(min: 3.0, max: -3.0) ))
                
            }
        }
    }
    
    static func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
            return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min
    }
    
    func setUpANewGame() {
        //To do: (make a ball color chooser at some point)
        addBall(ofColor: UIColor.blue, numberToAdd: 5)
        
    }
}

