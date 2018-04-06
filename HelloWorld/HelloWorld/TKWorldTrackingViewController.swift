//
//  TKWorldTrackingViewController.swift
//  HelloWorld
//
//  Created by tank on 2018/4/5.
//  Copyright © 2018 webank. All rights reserved.
//

import UIKit
import ARKit

class TKWorldTrackingViewController: UIViewController,ARSCNViewDelegate {
    
    var sceneView : ARSCNView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        sceneView = ARSCNView(frame: view.bounds)
        sceneView.delegate = self
        view.addSubview(sceneView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = [.horizontal, .vertical] // 支持水平和垂直面检测
        configuration.isLightEstimationEnabled = true
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // 1. 判断当前新增的锚点类型
        guard anchor is ARPlaneAnchor else { return }
        
        // 2. 在检测到的平面处添加 box
        let box = SCNBox(width: 0.08, height: 0.08, length: 0.08, chamferRadius: 0)
        let boxNode = SCNNode(geometry: box)
        node.addChildNode(boxNode)
        
    }

}
