//
//  GameRulesScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit

class GameRulesScene: SKScene {
    
    // MARK: - Properties
    
    var backButton: SKSpriteNode!
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = SKColor.purple
        let gameRulesBackground = SKSpriteNode(imageNamed: "gameRulesBg")
        gameRulesBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        gameRulesBackground.size = CGSize(width: 2048, height: 1536)
        gameRulesBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(gameRulesBackground)
        
        let texture1 = SKTexture(imageNamed: "gameRulesLabel")
        let sprite1 = SKSpriteNode(texture: texture1)
        sprite1.position = CGPoint(x: 970, y: 1350)
        sprite1.size = CGSize(width: 1000, height: 60)
        sprite1.zPosition = 10
        addChild(sprite1)
        
        let texture2 = SKTexture(imageNamed: "welcomeText")
        let sprite2 = SKSpriteNode(texture: texture2)
        sprite2.position = CGPoint(x: 970, y: 1100)
        sprite2.size = CGSize(width: 1450, height: 160)
        sprite2.zPosition = 10
        addChild(sprite2)
        
        let texture3 = SKTexture(imageNamed: "rulesText")
        let sprite3 = SKSpriteNode(texture: texture3)
        sprite3.position = CGPoint(x: 970, y: 580)
        sprite3.size = CGSize(width: 1700, height: 800)
        sprite3.zPosition = 10
        addChild(sprite3)
        
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
                menuScene.scaleMode = .aspectFill
                self.view?.presentScene(menuScene, transition: transition)
            }
        }
    }
    
    
}

