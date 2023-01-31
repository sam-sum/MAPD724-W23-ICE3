//
//  Cloud.swift
//  MAPD724-W23-ICE2
//
//  Created by Samuel Sum on 2023-01-23.
//

import GameplayKit
import SpriteKit

class Cloud : GameObject, GameProtocol {

    init() {
        super.init(imageString: "cloud", initialScale: 1.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCylce Functions
    func Start() {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    func Update() {
        Move()
        CheckBounds()
    }
    
    func CheckBounds() {
        if(position.y <= -902)
        {
            Reset()
        }
    }
    
    func Reset() {
        // randomize the vertical speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize the horizontal speed
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // get a pseudo random number -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        // get a pseudo random number 902 to 932
        let randomY:Int = (randomSource?.nextInt(upperBound: 30))! + 902
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    func Move() {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
