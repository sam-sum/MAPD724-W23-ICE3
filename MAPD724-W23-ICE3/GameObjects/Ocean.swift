//
//  Ocean.swift
//  MAPD724-W23-ICE2
//
//  Created by Samuel Sum on 2023-01-23.
//
import GameplayKit
import SpriteKit

class Ocean : GameObject, GameProtocol {
    
    // constructor
    init() {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Move() {
        position.y -= verticalSpeed!
    }
    
    // LifeCycle Functions
    func Start() {
        zPosition = Layer.ocean.rawValue
        verticalSpeed = 5.0
    }
    
    func Update() {
        Move()
        CheckBounds()
    }
    
    
    func CheckBounds() {
        if(position.y <= -2252)
        {
            Reset()
        }
    }
    
    func Reset() {
        position.y = 2252
    }
}
