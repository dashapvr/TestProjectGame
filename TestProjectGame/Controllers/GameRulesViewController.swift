//
//  GameRulesViewController.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameRulesViewController: UIViewController {
    
//    let image = UIImage(named: "gameRulesLabel")
//    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let gameRulesScene = GameRulesScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        gameRulesScene.scaleMode = .aspectFill
        skView.presentScene(gameRulesScene)
        
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = image
//        skView.presentScene(imageView)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
