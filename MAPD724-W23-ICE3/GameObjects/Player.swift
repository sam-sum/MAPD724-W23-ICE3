//
//  Player.swift
//  MAPD724-W23-ICE2
//
//  Created by Samuel Sum on 2023-01-23.
//
import GameplayKit
import SpriteKit

class Player : GameObject, GameProtocol
{
    // initializer
    init() {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    func Start() {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    func Update() {
        CheckBounds()
    }
    
    func CheckBounds() {
        // constrain the player on the left boundary
        if(position.x <= -320)
        {
            position.x = -320
        }
        
        // constrain the player on the right boundary
        if(position.x >= 320)
        {
            position.x = 320
        }
    }
    
    func Reset() {
        position.y = -655
    }
    
    func TouchMove(newPos: CGPoint){
        position = newPos
    }

}
