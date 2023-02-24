//
//  SettingsViewController.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let gameRulesScene = SettingsScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        gameRulesScene.scaleMode = .aspectFill
        skView.presentScene(gameRulesScene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
