//
//  ViewController.swift
//  ARkitGame
//
//  Created by priom on 2017-06-28.
//  Copyright © 2017 Priom Tech. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var counter: UILabel!

    var counterScore:Int = 0 {
        didSet {
            counter.text = "\(counterScore)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = SCNScene()

        sceneView.scene = scene
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingSessionConfiguration()

        sceneView.session.run(configuration)

        addObject()
    }

    func addObject() {
        let ship = SpaceShip()
        ship.loadModel()

        let xPos = randomPosition(lowerBound: -1, upperBound: 1)
        let yPos = randomPosition(lowerBound: -1, upperBound: 1)

        ship.position = SCNVector3(xPos, yPos, -1)

        sceneView.scene.rootNode.addChildNode(ship)
    }

    func randomPosition (lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float (arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: sceneView)

            let hitList = sceneView.hitTest(location, options: nil)

            if let hitObject = hitList.first {
                let node = hitObject.node

                if node.name == "ARShip" {
                    counterScore += 1
                    node.removeFromParentNode()

                    addObject()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

