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
        
        let lvlOneButton = SKSpriteNode(imageNamed: "lvl1")
        lvlOneButton.name = "lvl1"
        lvlOneButton.position = CGPoint(x: backButton.position.x + 180, y: backButton.position.y - 200)
        lvlOneButton.size = CGSize(width: 580, height: 200)
        lvlOneButton.zPosition = 2000
        addChild(lvlOneButton)
    
        let lvlTwoButton = SKSpriteNode(imageNamed: "lvl2")
        lvlTwoButton.name = "lvl2"
        lvlTwoButton.position = CGPoint(x: lvlOneButton.position.x + 625, y: lvlOneButton.position.y)
        lvlTwoButton.size = CGSize(width: 580, height: 200)
        lvlTwoButton.zPosition = 2000
        addChild(lvlTwoButton)
        
        let lvlThreeButton = SKSpriteNode(imageNamed: "lvl3")
        lvlThreeButton.name = "lvl3"
        lvlThreeButton.position = CGPoint(x: lvlTwoButton.position.x + 625, y: lvlTwoButton.position.y)
        lvlThreeButton.size = CGSize(width: 580, height: 200)
        lvlThreeButton.zPosition = 200
        addChild(lvlThreeButton)
        
        let lvlFourButton = SKSpriteNode(imageNamed: "lvl4")
        lvlFourButton.name = "lvl4"
        lvlFourButton.position = CGPoint(x: lvlOneButton.position.x, y: lvlOneButton.position.y - 210)
        lvlFourButton.size = CGSize(width: 580, height: 200)
        lvlFourButton.zPosition = 200
        addChild(lvlFourButton)
        
        let lvlFiveButton = SKSpriteNode(imageNamed: "lvl5")
        lvlFiveButton.name = "lvl5"
        lvlFiveButton.position = CGPoint(x: lvlTwoButton.position.x, y: lvlTwoButton.position.y - 210)
        lvlFiveButton.size = CGSize(width: 580, height: 200)
        lvlFiveButton.zPosition = 200
        addChild(lvlFiveButton)
        
        let lvlSixButton = SKSpriteNode(imageNamed: "lvl6")
        lvlSixButton.name = "lvl6"
        lvlSixButton.position = CGPoint(x: lvlThreeButton.position.x, y: lvlThreeButton.position.y - 210)
        lvlSixButton.size = CGSize(width: 580, height: 200)
        lvlSixButton.zPosition = 200
        addChild(lvlSixButton)
        
        let lvlSevenButton = SKSpriteNode(imageNamed: "lvl7")
        lvlSevenButton.name = "lvl7"
        lvlSevenButton.position = CGPoint(x: lvlFourButton.position.x, y: lvlFourButton.position.y - 210)
        lvlSevenButton.size = CGSize(width: 580, height: 200)
        lvlSevenButton.zPosition = 200
        addChild(lvlSevenButton)
        
        let lvlEightButton = SKSpriteNode(imageNamed: "lvl8")
        lvlEightButton.name = "lvl8"
        lvlEightButton.position = CGPoint(x: lvlFiveButton.position.x, y: lvlFiveButton.position.y - 210)
        lvlEightButton.size = CGSize(width: 580, height: 200)
        lvlEightButton.zPosition = 200
        addChild(lvlEightButton)
        
        let lvlNineButton = SKSpriteNode(imageNamed: "lvl9")
        lvlNineButton.name = "lvl9"
        lvlNineButton.position = CGPoint(x: lvlSixButton.position.x, y: lvlSixButton.position.y - 210)
        lvlNineButton.size = CGSize(width: 580, height: 200)
        lvlNineButton.zPosition = 200
        addChild(lvlNineButton)
        
        let lvlTenButton = SKSpriteNode(imageNamed: "lvl10")
        lvlTenButton.name = "lvl10"
        lvlTenButton.position = CGPoint(x: lvlSevenButton.position.x, y: lvlSevenButton.position.y - 210)
        lvlTenButton.size = CGSize(width: 580, height: 200)
        lvlTenButton.zPosition = 200
        addChild(lvlTenButton)
        
        let lvlElevenButton = SKSpriteNode(imageNamed: "lvl11")
        lvlElevenButton.name = "lvl11"
        lvlElevenButton.position = CGPoint(x: lvlEightButton.position.x, y: lvlEightButton.position.y - 210)
        lvlElevenButton.size = CGSize(width: 580, height: 200)
        lvlElevenButton.zPosition = 200
        addChild(lvlElevenButton)
        
        let lvlTwelveButton = SKSpriteNode(imageNamed: "lvl12")
        lvlTwelveButton.name = "lvl12"
        lvlTwelveButton.position = CGPoint(x: lvlNineButton.position.x, y: lvlNineButton.position.y - 210)
        lvlTwelveButton.size = CGSize(width: 580, height: 200)
        lvlTwelveButton.zPosition = 200
        addChild(lvlTwelveButton)
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
            
            if touchesNode.name == "lvl1" {
                let transition = SKTransition.fade(withDuration: 0.5)
                let levelOneScene = LevelOneScene(size: self.size)
//                levelOneScene.scaleMode = .aspectFill
                self.view?.presentScene(levelOneScene, transition: transition)
            }
            
            if touchesNode.name == "lvl2" {
                let transition = SKTransition.fade(withDuration: 0.5)
                let levelOneScene = LevelTwoScene(size: self.size)
//                levelOneScene.scaleMode = .aspectFill
                self.view?.presentScene(levelOneScene, transition: transition)
            }
        }
    }
}
