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
    static let ball: UInt32 = 0x1 << 1
    static let wall: UInt32 = 0x1 << 2
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
                ballNode.physicsBody!.applyImpulse(CGVector(dx: EntityManager.randomCGFloat(min: 0.0, max: 2.0), dy: EntityManager.randomCGFloat(min: -2.0, max: 2.0) ))
                ballNode.position = CGPoint(x: 100.00, y: 100.00)
                ballNode.physicsBody!.categoryBitMask = PhysicsCategory.ball
                ballNode.physicsBody!.contactTestBitMask = PhysicsCategory.wall | PhysicsCategory.ball
                ballNode.physicsBody!.collisionBitMask = PhysicsCategory.wall | PhysicsCategory.ball
                
            }
        }
    }
    
    func addWall(toSide: String) {
        
        var wallEntity: WallEntity
        
        switch toSide {
        case "left-wall":
            wallEntity = WallEntity(type: toSide, origin: scene.frame.origin, term: CGPoint(x: 1.0, y: scene.frame.height))
        case "right-wall":
            wallEntity = WallEntity(type: toSide, origin: CGPoint(x: scene.frame.origin.x + scene.frame.width - 1.0, y: scene.frame.origin.y), term: CGPoint(x: 1.0, y: scene.frame.height))
        case "top-wall":
            wallEntity = WallEntity(type: toSide, origin: CGPoint(x: scene.frame.origin.x + 1.0, y: scene.frame.height - 1.0), term: CGPoint(x: scene.frame.width - 1.0, y: 1.0))
        case "bottom-wall":
            wallEntity = WallEntity(type: toSide, origin: CGPoint(x: scene.frame.origin.x + 1.0, y: scene.frame.origin.y), term: CGPoint(x: scene.frame.width - 1.0, y: 1.0))
        default:
            wallEntity = WallEntity(failedToBuildWall: toSide)
        }
        
        entities.insert(wallEntity)
        if let wallNode = wallEntity.component(ofType: WallSideComponent.self)?.wallSide {
            wallNode.name = toSide
            scene.addChild(wallNode)
            wallNode.physicsBody!.categoryBitMask = PhysicsCategory.wall
            wallNode.physicsBody!.contactTestBitMask = PhysicsCategory.ball
            wallNode.physicsBody!.collisionBitMask = PhysicsCategory.ball
            
        }
        
    }
    
    static func randomCGFloat(min: CGFloat, max: CGFloat) -> CGFloat {
        return ceil(CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (max - min) + min)
    }
    
    func setUpANewGame() {
        addBall(ofColor: UIColor.blue, numberToAdd: 5)
       // addWall(toSide: "left-wall")
       // addWall(toSide: "right-wall")
       // addWall(toSide: "top-wall")
       // addWall(toSide: "bottom-wall")
        
    }
}

