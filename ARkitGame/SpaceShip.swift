//
//  SpaceShip.swift
//  ARkitGame
//
//  Created by priom on 2017-06-28.
//  Copyright © 2017 Priom Tech. All rights reserved.
//

import ARKit

class SpaceShip: SCNNode {
    func loadModel() {
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/ship.scn") else {return}

        let wrapperNode = SCNNode()

        for child in virtualObjectScene.rootNode.childNodes {
            wrapperNode.addChildNode(child)
        }

        self.addChildNode(wrapperNode)
    }
}
