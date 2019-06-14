//
//  Animacion.swift
//  FunWithFlags
//
//  Created by Macbook on 6/12/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit
import Lottie

class Animacion: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimation
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        
        view.addSubview(animationView)
        animationView.loopAnimation = true
        animationView.play()
        
    }
    
}

