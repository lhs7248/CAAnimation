//
//  ViewController.swift
//  01、CAEmitter
//
//  Created by lhs7248 on 16/8/9.
//  Copyright © 2016年 lhs7248. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }



    private var emitter:CAEmitterLayer!
    private var particle:CAEmitterCell!
    
    func setUp() -> Void {
        
        

        emitter = CAEmitterLayer();
        
        emitter.bounds = view.bounds
        emitter.emitterMode = kCAEmitterLayerOutline
        emitter.emitterShape = kCAEmitterLayerSphere
        emitter.renderMode = kCAEmitterLayerUnordered
        
        
        emitter.preservesDepth = true;
        

        
        
        
        particle = CAEmitterCell()

        particle.contents = UIImage(named:"smoke")?.CGImage
        
//        particle.color = UIColor.redColor().CGColor
        
        particle.birthRate = 10;
        
        particle.lifetime = 50;
        particle.lifetimeRange = 5;
        
        particle.velocity = 20;
        particle.velocityRange = 10;
        
        particle.scale = 0.02;
        particle.scaleRange = 0.1;
        particle.scaleSpeed = 0.02;
        
        
        
        emitter.emitterCells = [particle];
        
//        
//        emitter.emitterSize = view.bounds.size;
//        emitter.emitterPosition = view.center
//        
        view.layer.addSublayer(self.emitter)
        
        
    }



}

