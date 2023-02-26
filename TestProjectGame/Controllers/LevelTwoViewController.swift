//
//  LevelTwoViewController.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 26.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class LevelTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let levelTwoScene = LevelTwoScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        levelTwoScene.scaleMode = .aspectFill
        skView.presentScene(levelTwoScene)
    
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
