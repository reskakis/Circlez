//
//  EntityManager.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/10/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let ball: UInt32 = 0x1 << 0
    static let wall: UInt32 = 0x1 << 1
}

class EntityManager {
    
    var entities = Set<GKEntity>()
    var balls = [BallEntity]()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func addBall(ofColor: UIColor, numberToAdd: Int) {
        for _ in 1...numberToAdd {
            let ballEntity = BallEntity(ofColor: ofColor)
            entities.insert(ballEntity)
            if let ballNode = ballEntity.component(ofType: BallConfigComponent.self)?.ball {
                ballNode.name = "ball"
                //      balls.append(initialEntity)
                scene.addChild(ballNode)
                //         ballNode.physicsBody!.applyImpulse(CGVector(dx: EntityManager.randomCGFloat(min: 3.0, max: -3.0), //dy: EntityManager.randomCGFloat(min: 3.0, max: -3.0) ))
                ballNode.physicsBody!.applyImpulse(CGVector(dx: 3.0, dy: -3.0) )
                ballNode.physicsBody!.categoryBitMask = PhysicsCategory.ball
                ballNode.physicsBody!.contactTestBitMask = PhysicsCategory.ball | PhysicsCategory.wall
                ballNode.physicsBody!.collisionBitMask = PhysicsCategory.ball | PhysicsCategory.wall
                
            }
        }
    }
    
    func addWall(toSide: String) {
        
        //if left
        let wallEntity = WallEntity(type: toSide, origin: scene.frame.origin, term: CGPoint(x: 10.0, y: scene.frame.height))
        entities.insert(wallEntity)
        if let wallNode = wallEntity.component(ofType: WallSideComponent.self)?.wallSide {
            wallNode.name = "left-wall"
            scene.addChild(wallNode)
            wallNode.physicsBody!.categoryBitMask = PhysicsCategory.wall
            wallNode.physicsBody!.contactTestBitMask = PhysicsCategory.wall | PhysicsCategory.ball
            wallNode.physicsBody!.collisionBitMask = PhysicsCategory.wall | PhysicsCategory.ball
            
        }
        
    }
    
    static func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return ceil(CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min)
    }
    
    func setUpANewGame() {
        //To do: (make a ball color chooser at some point)
        addWall(toSide: "left")
        addBall(ofColor: UIColor.blue, numberToAdd: 1)
        
    }
}

