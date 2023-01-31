//
//  CollisionManager.swift
//  MAPD724-W23-ICE3
//
//  Created by Samuel Sum on 2023-01-30.
//

import SpriteKit
import GameplayKit

class CollisionManager {
    public static var gameViewController: GameViewController?
    
    // Utility Functions
    public static func SquareDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        let Xs: CFloat = CFloat(point2.x - point1.x)
        let Ys: CFloat = CFloat(point2.y - point1.y)
        return CGFloat(Xs * Xs + Ys * Ys)
    }
    
    // Collision Functions
    public static func SquareRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        if (SquareDistance(point1: P1, point2: P2) < Radii * Radii) {
            // we have a collision
            if (!(object2.isColliding ?? false)) {
                switch(object2.name) {
                case "island":
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    print("Collided with Island")
                    break
                case "cloud":
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    print("Collided with Cloud")
                    break
                default:
                    break
                }
            }
        }
    }
}
