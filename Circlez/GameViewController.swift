//
//  GameViewController.swift
//  Circlez
//
//  Created by Cory Reskakis on 10/8/17.
//  Copyright © 2017 Cory Reskakis. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    override func viewDidLoad() {
        //Don't touch
        super.viewDidLoad()
        
        //Create a new GK Scene (this is like the high level container)
        if let scene = GKScene(fileNamed: "GameScene") {
            
            //Create a SKScene that the GKScene will have inside of it
            if let sceneRootNode = scene.rootNode as! GameScene? {
                sceneRootNode.scaleMode = .resizeFill
                sceneRootNode.anchorPoint = CGPoint(x: 0.0, y: 0.0)
                
                //The SKScene has to have a view to actualy display, this is the SKView which presents the scene
                if let view = self.view as! SKView? {
                    view.ignoresSiblingOrder = true;
                    view.showsNodeCount = true;
                    view.showsFPS = true;
                    view.presentScene(sceneRootNode)
                }
            }
        }
    }
}
