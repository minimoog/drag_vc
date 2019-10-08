//
//  ViewController.swift
//  drag_vc
//
//  Created by Antonie Jovanoski on 10/8/19.
//  Copyright © 2019 Antonie Jovanoski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func panenka(_ panRecognizer: UIPanGestureRecognizer) {
        guard let view = panRecognizer.view else { return }
        
        let translation = panRecognizer.translation(in: view)
    
        trailingConstraint.constant -= translation.x
        
        if trailingConstraint.constant < 20 {
            trailingConstraint.constant = 20
        }
        
        topConstraint.constant += translation.y
        
        if topConstraint.constant < 20 {
            topConstraint.constant = 20
        }
        
        panRecognizer.setTranslation(.zero, in: view)
    }
    
    @IBAction func pinch(_ pinchGestureRecognizer: UIPinchGestureRecognizer) {
        guard let view = pinchGestureRecognizer.view else { return }
        
        let scale = pinchGestureRecognizer.scale
        
        heightConstraint.constant *= scale
        
        if heightConstraint.constant < 100 { heightConstraint.constant = 100 }
        if heightConstraint.constant > 512 { heightConstraint.constant = 512 }
        
        widthConstraint.constant *= scale
        
        if widthConstraint.constant < 100 { widthConstraint.constant = 100 }
        if widthConstraint.constant > 512 { widthConstraint.constant = 512 }
        
        pinchGestureRecognizer.scale = 1.0
    }
    
    
    @IBAction func tachi(_ sender: UIButton) {
        
    }
}

