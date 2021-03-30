//
//  ViewController.swift
//  Some
//
//  Created by Emilia Nedyalkova on 23.03.21.
//

import UIKit

class ConversionViewController: UIViewController {
    // var gradient = CAGradientLayer()
    var bgColors: [UIColor] = [
        UIColor.purple, UIColor.blue, UIColor.green,
        UIColor.yellow, UIColor.red
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
        
        /*
        gradient.colors = [
            UIColor.purple.cgColor,
            UIColor.blue.cgColor, UIColor.green.cgColor,
            UIColor.yellow.cgColor, UIColor.red.cgColor
        ]
        
        view.layer.insertSublayer(gradient, at: 0)
        */
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // gradient.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = bgColors.randomElement()
    }
}

