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
    var _defaultCircleSize: CGFloat = 10.0                 //Change ball size
    
    override init() {
        
        //use if lets here in next review
        
        ball = SKShapeNode(circleOfRadius: _defaultCircleSize)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: max(ball.frame.size.width/2,ball.frame.size.height/2) )
        ball.physicsBody!.restitution = 1.0
        ball.physicsBody!.friction = 0.0
        ball.physicsBody!.angularDamping = 0.0
        ball.physicsBody!.linearDamping = 0.0
                
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

