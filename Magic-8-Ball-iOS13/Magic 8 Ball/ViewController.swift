//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    override func viewDidLoad() {
        imageView.isHidden = true
    }

    @IBAction func askButtonpressed(_ sender: UIButton) {
        imageView.isHidden = false
        var randomNumber = Int.random(in: 0..<5)
        imageView.image = ballArray[randomNumber]
    }
}

