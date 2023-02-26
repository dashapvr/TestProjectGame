//
//  LevelOneViewController.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 26.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class LevelOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let levelOneScene = LevelOneScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        levelOneScene.scaleMode = .aspectFill
        skView.presentScene(levelOneScene)
       
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


