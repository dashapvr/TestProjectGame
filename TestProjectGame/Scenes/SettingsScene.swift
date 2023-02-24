//
//  SettingsScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 23.02.2023.
//

import UIKit
import SpriteKit
import Cosmos

class SettingsScene: SKScene {
    
    // MARK: - Properties
    
    var soundButton = SKSpriteNode()
    let soundButtonTex = SKTexture(imageNamed: "sound")
    
    var vibroButton = SKSpriteNode()
    let vibroButtonTex = SKTexture(imageNamed: "vibro")
    
    var acceptButton = SKSpriteNode()
    let acceptButtonTex = SKTexture(imageNamed: "accept")
    
    var notAcceptButton = SKSpriteNode()
    let notAcceptTex = SKTexture(imageNamed: "notAccept")
    
    var rateUsButton = SKSpriteNode()
    let rateUsTex = SKTexture(imageNamed: "rateUs")
    
    let customView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
    let starRatingControl = CosmosView()
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = SKColor.blue
        let settingsBackground = SKSpriteNode(imageNamed: "background")
        settingsBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        settingsBackground.size = CGSize(width: 2048, height: 1536)
        settingsBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(settingsBackground)
        
        let textureSettings = SKTexture(imageNamed: "settingsLabel")
        let spriteSettings = SKSpriteNode(texture: textureSettings)
        spriteSettings.position = CGPoint(x: 1050, y: 1350)
        spriteSettings.size = CGSize(width: 1000, height: 70)
        spriteSettings.zPosition = 10
        addChild(spriteSettings)
        
        soundButton = SKSpriteNode(texture: soundButtonTex)
        soundButton.position = CGPoint(x: frame.midX - 180, y: frame.midY + 365)
        soundButton.size = CGSize(width: 1450, height: 125)
        soundButton.zPosition = 50
        addChild(soundButton)
        
        vibroButton = SKSpriteNode(texture: vibroButtonTex)
        vibroButton.position = CGPoint(x: frame.midX - 180, y: soundButton.position.y - 160)
        vibroButton.size = CGSize(width: 1450, height: 125)
        vibroButton.zPosition = 50
        addChild(vibroButton)
        
        acceptButton = SKSpriteNode(texture: acceptButtonTex)
        acceptButton.position = CGPoint(x: soundButton.position.x + 970, y: soundButton.position.y)
        acceptButton.size = CGSize(width: 300, height: 100)
        acceptButton.zPosition = 50
        addChild(acceptButton)
        
        notAcceptButton = SKSpriteNode(texture: notAcceptTex)
        notAcceptButton.position = CGPoint(x: vibroButton.position.x + 970, y: vibroButton.position.y)
        notAcceptButton.size = CGSize(width: 300, height: 100)
        notAcceptButton.zPosition = 50
        addChild(notAcceptButton)
        
        rateUsButton = SKSpriteNode(texture: rateUsTex)
        rateUsButton.position = CGPoint(x: frame.midX + 20, y: vibroButton.position.y - 160)
        rateUsButton.size = CGSize(width: 1850, height: 125)
        rateUsButton.zPosition = 50
        addChild(rateUsButton)
        
        let alert = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 50))
        alert.name = "alert"
        alert.position = rateUsButton.position
        addChild(alert)
        
        starRatingControl.settings.fillMode = .half
        starRatingControl.settings.totalStars = 5
        starRatingControl.settings.emptyBorderColor = #colorLiteral(red: 1, green: 0, blue: 0.8382834792, alpha: 1)
        starRatingControl.settings.filledBorderColor = #colorLiteral(red: 1, green: 0, blue: 0.8382834792, alpha: 1)
        starRatingControl.settings.filledColor = #colorLiteral(red: 1, green: 0, blue: 0.8382834792, alpha: 1)
        starRatingControl.settings.updateOnTouch = true
        customView.addSubview(starRatingControl)
        
        let backButton = SKSpriteNode(imageNamed: "backButton")
        backButton.name = "backButton"
        backButton.position = CGPoint(x: frame.midX - 800, y: frame.midY + 590)
        backButton.size = CGSize(width: 300, height: 100)
        backButton.zPosition = 100
        addChild(backButton)
    }
}

// MARK: - Extensions

extension SettingsScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let nodes = self.nodes(at: location)

            for node in nodes {
                if node.name == "alert" {
                    showAlert()
                }
            }
        }
        
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

extension SettingsScene {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Do you like to play our game?", message: "Tap a star to rate it on the App Store", preferredStyle: .alert)
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) in
            print("Cancel button tapped")
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (action: UIAlertAction!) in
            print("Submit button tapped")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(submitAction)
        alertController.view.addSubview(customView)
        self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

