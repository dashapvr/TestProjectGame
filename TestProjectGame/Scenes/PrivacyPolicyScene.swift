//
//  PrivacyPolicyScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit

class PrivacyPolicyScene: SKScene {
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = SKColor.green
        
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
