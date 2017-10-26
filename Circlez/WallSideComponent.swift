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
        wallSide.physicsBody = SKPhysicsBody(edgeFrom: start, to: end)
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


