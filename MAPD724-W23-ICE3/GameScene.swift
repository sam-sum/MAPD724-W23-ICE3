//
//  GameScene.swift
//  MAPD724-W23-ICE3
//
//  Created by Samuel Sum on 2023-01-30.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ocean1 : Ocean?
    var ocean2 : Ocean?
    var player : Player?
    var island : Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad() {
        name = "GAME"
                
        // add ocean1 to the scene and starts it at the Reset location
        ocean1 = Ocean()
        ocean1?.Start()
        ocean1?.Reset()
        addChild(ocean1!)
        
        // add ocean2 to the scene and starts it lower
        ocean2 = Ocean()
        ocean2?.Start()
        ocean2?.position.y = -627
        addChild(ocean2!)
        
        // add the player to the scene
        player = Player()
        player?.Start()
        addChild(player!)
        
        // add the island to the scene
        island = Island()
        addChild(island!)
        
        // add 3 clouds to the scene
        for _ in 0...2 {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -655))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -655))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x: pos.x, y: -655))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        CollisionManager.SquareRadiusCheck(scene: self, object1: player!, object2: island!)
        
        // update each cloud in clouds
        for cloud in clouds {
            cloud.Update()
            CollisionManager.SquareRadiusCheck(scene: self, object1: player!, object2: cloud)
        }
    }
}

