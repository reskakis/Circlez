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
    
    let ball: SKShapeNode
    let ballBitMask: UInt32 = 0x1 << 0
    var _defaultCircleSize: CGFloat = 10.0                 //Change ball size
    
    init(ofColored: UIColor) {
        
        //use if lets here in next review
        
        ball = SKShapeNode(circleOfRadius: _defaultCircleSize)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: _defaultCircleSize)
        ball.fillColor = ofColored
        ball.physicsBody!.isDynamic = true;
        ball.physicsBody!.restitution = 1.0
        ball.physicsBody!.friction = 0.0
        ball.physicsBody!.angularDamping = 0.0
        ball.physicsBody!.linearDamping = 0.0
        ball.physicsBody!.allowsRotation = false
        ball.physicsBody!.affectedByGravity = false
        ball.physicsBody!.categoryBitMask = ballBitMask
        ball.physicsBody!.contactTestBitMask = ballBitMask
        ball.physicsBody!.collisionBitMask = ballBitMask

        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

