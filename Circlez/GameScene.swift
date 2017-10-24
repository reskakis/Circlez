//
//  GameScene.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/8/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var entityManager: EntityManager!
    var i = 0;

    override func sceneDidLoad() {
        
    }
    
    override func didMove(to view: SKView) {
        entityManager = EntityManager(scene: self)
        setUpGLobalPropertiesForGame()
        entityManager.setUpANewGame()
    }
    
    func setUpGLobalPropertiesForGame() {
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let leftWall = CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + self.frame.size.height/2)
        let rightWall = CGPoint(x: self.frame.origin.x + self.frame.size.width, y: self.frame.origin.y + self.frame.size.height/2)
        
        let bottomWall = CGPoint(x: self.frame.origin.x + self.frame.size.width/2, y: self.frame.origin.y)
        let topWall = CGPoint(x: self.frame.origin.x + self.frame.size.width/2, y: self.frame.origin.y + self.frame.size.height)
        
        print("---------------------------------------------------")
        print(contact.bodyB.node!.position)
        let leftCalc = getDistance(p1: leftWall, p2: contact.bodyB.node!.position)
        print(contact.bodyB.node!.position)
        let rightCalc = getDistance(p1: rightWall, p2: contact.bodyB.node!.position)
        print(contact.bodyB.node!.position)
        let topCalc = getDistance(p1: topWall, p2: contact.bodyB.node!.position)
        print(contact.bodyB.node!.position)
        let bottomCalc = getDistance(p1: bottomWall, p2: contact.bodyB.node!.position)
        print(contact.bodyB.node!.position)
        print("---------------------------------------------------")

        print("left value", leftCalc)
        print("right value", rightCalc)
        print("top value", topCalc)
        print("bottom value", bottomCalc)
        print("-----------------------------------")
    }
    
    func getDistance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        let xDist = p2.x - p1.x
        let yDist = p2.y - p1.y
        return sqrt((xDist * xDist) + (yDist * yDist))
        
    }

}



