//
//  GameScene.swift
//  Project11-Pachinko
//
//  Created by Berkin İnceoğlu on 30.10.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var scoreLabel: SKLabelNode!
    var score = 0 {
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    var ballsUsed : Int = 0
    
    var editLabel: SKLabelNode!
    
    var editingMode: Bool = false{
        didSet{
            if editingMode{
                editLabel.text = "Done"
            }else{
                editLabel.text = "Edit"
            }
        }
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 334)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = "Score: 0"
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 980, y: 610)
        addChild(scoreLabel)
        
        editLabel = SKLabelNode(fontNamed: "Chalkduster")
        editLabel.text = "Edit"
        editLabel.horizontalAlignmentMode = .left
        editLabel.position = CGPoint(x: 20, y: 610)
        addChild(editLabel)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.contactDelegate = self
        
        makeSlot(at: CGPoint(x: 128, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 384, y: 0), isGood: false)
        makeSlot(at: CGPoint(x: 640, y: 0), isGood: true)
        makeSlot(at: CGPoint(x: 896, y: 0), isGood: false)
        
        makeBouncer(at: CGPoint(x: 0, y: 0))
        makeBouncer(at: CGPoint(x: 256, y: 0))
        makeBouncer(at: CGPoint(x: 512, y: 0))
        makeBouncer(at: CGPoint(x: 768, y: 0))
        makeBouncer(at: CGPoint(x: 1024, y: 0))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let objects = nodes(at: location)
        
        if objects.contains(editLabel){
            editingMode.toggle() // editingMode = !editingMode
        }else{
            if editingMode{
                let size = CGSize(width: Int.random(in: 16...128), height: 16)
                let box = SKSpriteNode(color: UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1)), size: size)
                
                box.zRotation = CGFloat.random(in: 0...3)
                box.position = location
                
                box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
                box.physicsBody?.isDynamic = false
                box.name = "obstacle"
                addChild(box)
            } else {
                if(ballsUsed <= 5){
                    let randomBallName = GetRandomBallColor(choice : Int.random(in: 1...7))
                    let ball = SKSpriteNode(imageNamed: randomBallName)
                    
                    ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.0)
                    ball.physicsBody?.restitution = 0.4
                    ball.physicsBody?.contactTestBitMask = ball.physicsBody?.collisionBitMask ?? 0
                    ball.position.x = location.x
                    ball.position.y = 620
                    ball.name = "ball"
                    addChild(ball)
                    ballsUsed += 1
                }
               
            }
            
        }
    }
    
    func makeBouncer(at position : CGPoint){
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width / 2.0)
        bouncer.physicsBody?.isDynamic = false
        addChild(bouncer)
    }
    
    func makeSlot(at position : CGPoint, isGood : Bool){
        var slotBase: SKSpriteNode
        var slotGlow: SKSpriteNode
        
        if isGood {
            slotBase = SKSpriteNode(imageNamed: "slotBaseGood")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowGood")
            slotBase.name = "good"
        }else{
            slotBase = SKSpriteNode(imageNamed: "slotBaseBad")
            slotGlow = SKSpriteNode(imageNamed: "slotGlowBad")
            slotBase.name = "bad"
        }
        
        slotBase.position = position
        slotGlow.position = position
        
        slotBase.physicsBody = SKPhysicsBody(rectangleOf: slotBase.size)
        slotBase.physicsBody?.isDynamic = false
        
        addChild(slotBase)
        addChild(slotGlow)
        
        let spin = SKAction.rotate(byAngle: .pi, duration: 10)
        let spinForever = SKAction.repeatForever(spin)
        slotGlow.run(spinForever)
    }
    
    func collision(between ball: SKNode, object : SKNode){
        if object.name == "good"{
            score += 1
            ballsUsed -= 1
            destroy(object: ball)
        }
        else if object.name == "bad"{
            score -= 1
            destroy(object: ball)
        }
        else if object.name == "obstacle"{
            destroy(object: object)
        }
    }
    
    func destroy(object: SKNode){
        if object.name == "ball"{
            if let fireParticles = SKEmitterNode(fileNamed: "FireParticles"){
                fireParticles.position = object.position
                addChild(fireParticles)
            }
        }
        else{
            if let fireParticles = SKEmitterNode(fileNamed: "Smoke"){
                fireParticles.position = object.position
                addChild(fireParticles)
            }
        }
        
        object.removeFromParent()
    }
    
    func didBegin(_ contact: SKPhysicsContact){
        guard let nodeA = contact.bodyA.node else { return }
        guard let nodeB = contact.bodyB.node else { return }
        
        if contact.bodyA.node?.name == "ball"{
            collision(between: nodeA, object: nodeB)
        }else if contact.bodyB.node?.name == "ball"{
            collision(between: nodeB, object: nodeA)
        }
    }
    
    func GetRandomBallColor(choice randInt: Int) -> String{
        switch randInt{
        case 1:
            return "ballBlue"
        case 2:
            return "ballCyan"
        case 3:
            return "ballGrey"
        case 4:
            return "ballPurple"
        case 5:
            return "ballYellow"
        case 6:
            return "ballGreen"
        default:
            return "ballRed"
        }
   
    }
    
    
    
}
