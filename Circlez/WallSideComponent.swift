//
//  ImageComponent.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/10/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class WallSideComponent: GKComponent {
    
    var wallSide: SKShapeNode
    
    init(side: String, start: CGPoint, end: CGPoint) {
        
        wallSide = SKShapeNode(rect: CGRect(x: start.x, y: start.y, width: end.x, height: end.y))
        
        switch side {
            
        case "left-wall":
            wallSide.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: start.x + 1.0, y: start.y), to: end)
            break
        case "right-wall":
            wallSide.physicsBody = SKPhysicsBody(edgeFrom: start, to: CGPoint(x: start.x, y: end.y))
            break
        case "top-wall":
            wallSide.physicsBody = SKPhysicsBody(edgeFrom: start, to: CGPoint(x: end.x, y: start.y))
            break
        case "bottom-wall":
            wallSide.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: start.x, y: start.y + 1.0), to: end)
            break
        default:
            wallSide.physicsBody = SKPhysicsBody(edgeFrom: start, to: end)

        }
 //       wallSide.physicsBody!.usesPreciseCollisionDetection = true

        
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


