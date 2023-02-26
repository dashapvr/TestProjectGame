//
//  LevelOneScene.swift
//  TestProjectGame
//
//  Created by Дарья Пивовар on 26.02.2023.
//

import UIKit
import SpriteKit

class LevelOneScene: SKScene {
    
    // MARK: - Properties
    
    var row: Int = 4
    var col: Int = 4
    var count: Int = 0
    var Timeauto: Timer!
    var width: CGFloat!
    var height: CGFloat!
    var imageViews: [UIImageView] = []
    
    var timerLabel: SKLabelNode!
    var remainingTime = 180 // 3 min
    
    // MARK: - Functions
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = SKColor.red
        let levelOneBackground = SKSpriteNode(imageNamed: "background")
        levelOneBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        levelOneBackground.size = CGSize(width: 2048, height: 1536)
        levelOneBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        levelOneBackground.zPosition = -1
        addChild(levelOneBackground)
        
        let backButton = SKSpriteNode(imageNamed: "backButtonLvl")
        backButton.name = "backButton"
        backButton.position = CGPoint(x: frame.midX - 800, y: frame.midY + 590)
        backButton.size = CGSize(width: 250, height: 87.5)
        backButton.zPosition = 100
        addChild(backButton)
        
        let cancelButton = SKSpriteNode(imageNamed: "cancel")
        cancelButton.name = "cancelButton"
        cancelButton.position = CGPoint(x: backButton.position.x + 350, y: backButton.position.y)
        cancelButton.size = CGSize(width: 250, height: 87.5)
        cancelButton.zPosition = 100
        addChild(cancelButton)
        
        let levelLabel = SKSpriteNode(imageNamed: "lvlOneLabel")
        levelLabel.position = CGPoint(x: cancelButton.position.x + 500, y: cancelButton.position.y)
        levelLabel.size = CGSize(width: 650, height: 90)
        levelLabel.zPosition = 100
        addChild(levelLabel)
        
        let patternImage = SKSpriteNode(imageNamed: "lvlOneImage")
        patternImage.position = CGPoint(x: frame.midX, y: frame.midY - 450)
        patternImage.size = CGSize(width: 1000, height: 350)
        patternImage.zPosition = 100
        addChild(patternImage)
        
        let timerBackground = SKSpriteNode(imageNamed: "timerBg")
        timerBackground.position = CGPoint(x: levelLabel.position.x + 650 , y: levelLabel.position.y)
        timerBackground.size = CGSize(width: 550, height: 90)
        timerBackground.zPosition = 200
        addChild(timerBackground)
        
        timerLabel = SKLabelNode(fontNamed: "Knewave")
        timerLabel.fontSize = 75
        timerLabel.fontColor = .systemPink
        timerLabel.horizontalAlignmentMode = .center
        timerLabel.verticalAlignmentMode = .center
        timerLabel.position = CGPoint(x: timerBackground.position.x, y: timerBackground.position.y)
        timerLabel.zPosition = 500
        addChild(timerLabel)
        
        createPuzzle()
        repeatAutoSort()
        startTimer()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let touchesNode = atPoint(location)
            
            if touchesNode.name == "backButton" {
                self.endGame()
                let transition = SKTransition.fade(withDuration: 0.5)
                let gameScene = GameScene(size: self.size)
                self.view?.presentScene(gameScene, transition: transition)
            }
        }
    }
    
    func startTimer() {
        let wait = SKAction.wait(forDuration: 1)
        let block = SKAction.run {
            [unowned self] in
            remainingTime -= 1
            timerLabel.text = "\(remainingTime)"
            let minutes = remainingTime / 60 ?? 0
            let seconds = remainingTime % 60 ?? 0
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
            
//            if remainingTime <= 0 {
//                endGame(won: false)
//                backgroundColor = UIColor.black
//            }
        }
        let sequence = SKAction.sequence([wait, block])
        let repeatAction = SKAction.repeatForever(sequence)
        run(repeatAction, withKey: "countdown")
    }
    
    func endGame() {
        removeAction(forKey: "countdown")
        removeAllActions()
    }
    
    func repeatAutoSort() {
        Timeauto = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(autosort), userInfo: nil, repeats: true)
    }
    
    @objc func autosort() {
        count += 1
        
        if count >= 50 {
            Timeauto.invalidate()
        }
        
        let move = width / CGFloat(col)
        var imageViewsTam = imageViews
        while imageViewsTam.count > 0 {
            let random = Int.random(in: 0...imageViewsTam.count - 1)
            let image = imageViewsTam[random]
            let x: CGFloat = image.frame.origin.x
            let y: CGFloat = image.frame.origin.y
            if checkMove(pos: CGPoint(x: x - move, y: y)) {
                UIView.animate(withDuration: 0.2) {
                    image.frame.origin.x -= move
                }
                return
            }
            
            if checkMove(pos: CGPoint(x: x + move, y: y)) {
                UIView.animate(withDuration: 0.2) {
                    image.frame.origin.x += move
                }
                return
            }
            
            if checkMove(pos: CGPoint(x: x, y: y + move)) {
                UIView.animate(withDuration: 0.2) {
                    image.frame.origin.y += move
                }
                return
            }
            
            if checkMove(pos: CGPoint(x: x, y: y - move)) {
                UIView.animate(withDuration: 0.2) {
                    image.frame.origin.y -= move
                }
                return
            }
            imageViewsTam.remove(at: random)
        }
    }
    
    
    func createPuzzle() {
        var count: Int = 0
        let image = UIImage(named: "lvlOneImage")?.resizeImage(imagesize: (self.view?.frame.width)!, row: CGFloat(row), col: CGFloat(col))
        width = image?.size.width
        height = image?.size.height
        let y = ((self.view?.frame.height)! / 2 - height / 2) - 80
        let imageConvert = image?.cgImage
        let sizeImage = width / CGFloat(col)
        
        for i in 0...row - 1 {
            for j in 0...col - 1 {
                let cropImage = imageConvert!.cropping(to: CGRect(x: CGFloat(j) * sizeImage, y: CGFloat(i) * sizeImage, width: sizeImage, height: sizeImage))
                let imageView = UIImageView(image: UIImage(cgImage: cropImage!))
                imageView.layer.borderWidth = 3
                imageView.layer.borderColor = UIColor.white.cgColor
                imageView.frame.origin = CGPoint(x: CGFloat(j) * sizeImage, y: CGFloat(i) * sizeImage + y)
                view?.addSubview(imageView)
                imageView.tag = count
                count += 1
                imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapImage(gesture:))))
                imageView.isUserInteractionEnabled = true
                imageViews.append(imageView)
            }
        }
        imageViews.last?.removeFromSuperview()
        imageViews.removeLast()
    }
    
    @objc func tapImage(gesture: UITapGestureRecognizer) {
        let image = gesture.view as! UIImageView
        let x  = image.frame.origin.x
        let y = image.frame.origin.y
        let move = width / CGFloat(col)
        print(image.tag)
        print(checkOut(pos: CGPoint(x: x, y: y - move)))
        
        if checkMove(pos: CGPoint(x: x - move, y: y)) {
            UIView.animate(withDuration: 0.2) {
                image.frame.origin.x -= move
            }
            return
        }
        
        if checkMove(pos: CGPoint(x: x + move, y: y)) {
            UIView.animate(withDuration: 0.2) {
                image.frame.origin.x += move
            }
            return
        }
        
        if checkMove(pos: CGPoint(x: x, y: y + move)) {
            UIView.animate(withDuration: 0.2) {
                image.frame.origin.y += move
            }
            return
        }
        
        if checkMove(pos: CGPoint(x: x, y: y - move)) {
            UIView.animate(withDuration: 0.2) {
                image.frame.origin.y -= move
            }
        }
        return
    }
    
    func checkMove(pos: CGPoint) -> Bool {
        var count: [UIImageView] = []
        count = imageViews.filter {$0.frame.origin.x - pos.x > -1 && $0.frame.origin.x - pos.x < 1 && $0.frame.origin.y - pos.y > -1 && $0.frame.origin.y - pos.y < 1}
        
        if count == [] && checkOut(pos: pos) {
            return true
        }
        return false
    }
    
    func checkOut(pos: CGPoint) -> Bool {
        let top: CGFloat = (self.view?.frame.height)! / 2 - height / 2 - 1
        let left: CGFloat = -1
        let right: CGFloat = width - width  / CGFloat(col) + 1
        let bottom: CGFloat = (self.view?.frame.height)! / 2 + height / 2 - width / CGFloat(col) + 1
        
        if pos.x < left || pos.x > right || pos.y < top || pos.y > bottom {
            return false
        }
        return true
    }
}

// MARK: - Extensions

extension UIImage {
    
    func resizeImage(imagesize: CGFloat, row: CGFloat, col: CGFloat) -> UIImage {
        let newSize = CGSize(width: imagesize, height: imagesize + (row - col) * imagesize / col)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
