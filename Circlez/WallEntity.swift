//
//  WallEntity.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/10/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class WallEntity: GKEntity {
    
    init(type: String, origin: CGPoint, term: CGPoint) {
        //eventually this will take a number of balls, a ball type, color etc.
        super.init()
        let newSide = WallSideComponent(side: type, start: origin, end: term)
        addComponent(newSide)
        
    }
    
    //To look up what this does below...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

