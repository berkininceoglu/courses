//
//  WhackSlot.swift
//  Project14-WhackaPenguin
//
//  Created by Berkin İnceoğlu on 10.11.2021.
//

import SpriteKit
import UIKit

class WhackSlot: SKNode {
    var charNode: SKSpriteNode!
    
    var loc = CGPoint(x: 0, y: 0)
    var isVisible = false
    var isHit = false
    
    func configure(at position : CGPoint){
        self.position = position
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
    }
    
    func show(hideTime : Double, at position : CGPoint){
        if isVisible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2) == 0 {
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        }
        else{
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        //showParticles(particleName: "BokehParticles",at : position)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)){
            [weak self] in
            self?.hide(at : position)
        }
    }
    
    func hide(at position : CGPoint){
        if !isVisible { return }
        
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
        
        //showParticles(particleName: "BokehParticles",at : position)
    }
    
    func hit(at position : CGPoint){
        isHit = true
        
        showParticles(particleName: "SmokeParticles", at : position)
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.25)
        let notVisible = SKAction.run {
            [weak self] in
            self?.isVisible = false
        }
        let sequence = SKAction.sequence([delay,hide,notVisible])
        charNode.run(sequence)
    }
    
    func showParticles(particleName : String, at position : CGPoint){
        if let particles = SKEmitterNode(fileNamed: particleName){
            particles.position = position
            addChild(particles)
        }
    }
}
