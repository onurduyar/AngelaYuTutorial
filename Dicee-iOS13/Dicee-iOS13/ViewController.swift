//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    
    let diceArray: [UIImage] = [UIImage(imageLiteralResourceName: "DiceSix"),
                                UIImage(imageLiteralResourceName: "DiceFive"),
                                UIImage(imageLiteralResourceName: "DiceFour"),
                                UIImage(imageLiteralResourceName: "DiceThree"),
                                UIImage(imageLiteralResourceName: "DiceTwo"),
                                UIImage(imageLiteralResourceName: "DiceOne")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func returnRandomNumber() -> Int{
        let randomNumber = Int.random(in: 0..<6)
        return randomNumber
    }
    @IBAction func rollButtonPressed(_sender: UIButton) {
        dice1.image = diceArray[returnRandomNumber()]
        dice2.image = diceArray[returnRandomNumber()]
    }

}

