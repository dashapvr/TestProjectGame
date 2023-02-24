//
//  GameViewController.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    
    @IBOutlet weak var lvl1Button: UIButton!
    
    @IBOutlet weak var lvl2Button: UIButton!
    
    @IBOutlet weak var lvl3Button: UIButton!
    
    @IBOutlet weak var lvl4Button: UIButton!
    
    @IBOutlet weak var lvl5Button: UIButton!
    
    @IBOutlet weak var lvl6Button: UIButton!
    
    @IBOutlet weak var lvl7Button: UIButton!
    
    @IBOutlet weak var lvl8Button: UIButton!
    
    @IBOutlet weak var lvl9Button: UIButton!
    
    @IBOutlet weak var lvl10Button: UIButton!
    
    @IBOutlet weak var lvl11Button: UIButton!
    
    @IBOutlet weak var lvl12Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameScene = GameScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        gameScene.scaleMode = .aspectFill
        skView.presentScene(gameScene)
        
    }
    
    
    @IBAction func lvl1ButtonAction(_ sender: Any) {
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
