//
//  Island.swift
//  MAPD724-W23-ICE2
//
//  Created by Samuel Sum on 2023-01-23.
//

import GameplayKit
import SpriteKit

class Island : GameObject, GameProtocol {
    // initializer / constructor
    init() {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCylce Functions
    func Start() {
        zPosition = Layer.island.rawValue
        verticalSpeed = 5.0
        Reset()
    }
    
    func Update() {
        Move()
        CheckBounds()
    }
    
    func CheckBounds() {
        if(position.y <= -876)
        {
            Reset()
        }
    }
    
    func Reset() {
        position.y = 876
        // get a pseudo random number -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    func Move() {
        position.y -= verticalSpeed!
    }
}
