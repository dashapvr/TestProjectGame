//
//  GameScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    // MARK: - Properties
    
    var playButton = SKSpriteNode()
    let playButtonTex = SKTexture(imageNamed: "play")
    
    var gameRulesButton = SKSpriteNode()
    let gameRulesTex = SKTexture(imageNamed: "gameRules")
    
    var settingsButton = SKSpriteNode()
    let settingsTex = SKTexture(imageNamed: "settings")
    
    var privacyPolicyButton = SKSpriteNode()
    let privacyPolicyTex = SKTexture(imageNamed: "privacyPolicy")
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = SKColor.black
        let background = SKSpriteNode(imageNamed: "menuBG")
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        playButton = SKSpriteNode(texture: playButtonTex)
        playButton.position = CGPoint(x: frame.midX, y: frame.midY + 85)
        playButton.size = CGSize(width: 650, height: 135)
        playButton.zPosition = 50
        addChild(playButton)
        
        gameRulesButton = SKSpriteNode(texture: gameRulesTex)
        gameRulesButton.position = CGPoint(x: frame.midX, y: playButton.position.y - 170)
        gameRulesButton.size = CGSize(width: 650, height: 135)
        gameRulesButton.zPosition = 50
        addChild(gameRulesButton)
        
        settingsButton = SKSpriteNode(texture: settingsTex)
        settingsButton.position = CGPoint(x: frame.midX, y: gameRulesButton.position.y - 170)
        settingsButton.size = CGSize(width: 650, height: 135)
        settingsButton.zPosition = 50
        addChild(settingsButton)
        
        privacyPolicyButton = SKSpriteNode(texture: privacyPolicyTex)
        privacyPolicyButton.position = CGPoint(x: frame.midX, y: settingsButton.position.y - 170)
        privacyPolicyButton.size = CGSize(width: 650, height: 135)
        privacyPolicyButton.zPosition = 50
        addChild(privacyPolicyButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                if view != nil {
                    let transition: SKTransition = SKTransition.fade(withDuration: 1)
                    let scene: SKScene = GameScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            } else if node == gameRulesButton {
                if view != nil {
                    let transition: SKTransition = SKTransition.fade(withDuration: 1)
                    let scene: SKScene = GameRulesScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            } else if node == settingsButton {
                if view != nil {
                    let transition: SKTransition = SKTransition.fade(withDuration: 1)
                    let scene: SKScene = SettingsScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            } else if node == privacyPolicyButton {
                if view != nil {
                    let transition: SKTransition = SKTransition.fade(withDuration: 1)
                    let scene: SKScene = PrivacyPolicyScene(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            } else {
                print("ERROR")
            }
        }
    }
}
