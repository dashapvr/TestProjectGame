//
//  GameScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit

class GameScene: SKScene {
    
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = SKColor.black
        let gameBackground = SKSpriteNode(imageNamed: "background")
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameBackground.size = CGSize(width: 2048, height: 1536)
        gameBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameBackground.zPosition = -1
        addChild(gameBackground)
        
        let textureLevels = SKTexture(imageNamed: "levelsLabel")
        let spriteLevels = SKSpriteNode(texture: textureLevels)
        spriteLevels.position = CGPoint(x: 1040, y: 1360)
        spriteLevels.size = CGSize(width: 800, height: 70)
        spriteLevels.zPosition = 10
        addChild(spriteLevels)
        
        let backButton = SKSpriteNode(imageNamed: "backButton")
        backButton.name = "backButton"
        backButton.position = CGPoint(x: frame.midX - 800, y: frame.midY + 590)
        backButton.size = CGSize(width: 300, height: 100)
        backButton.zPosition = 100
        addChild(backButton)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchesNode = atPoint(location)
            
            if touchesNode.name == "backButton" {
                let transition = SKTransition.fade(withDuration: 0.5)
                let menuScene = MenuScene(size: self.size)
                self.view?.presentScene(menuScene, transition: transition)
            }
        }
    }
}
