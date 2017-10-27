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
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true;
        skView.showsNodeCount = true;
        skView.showsFPS = true;
        skView.presentScene(scene)
        
    }
}

