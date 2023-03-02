//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitValue = 0.0
    
    var perPerson = 0.0
    override func viewDidLoad() {
     
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPcButton.isSelected = false
        sender.isSelected = true
       
        let buttonTitleMinusPercentSign = String(sender.currentTitle!.dropLast())
        
        
        tip = Double(buttonTitleMinusPercentSign)! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = sender.value
        splitNumberLabel.text = String(format: "%.0f", splitValue)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let totalAmount = Double(billTextField.text!) else {
            return
        }
        perPerson = (totalAmount + (totalAmount * tip)) / splitValue
       
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tipValue = tip * 100
            destinationVC.totalValue = perPerson
            destinationVC.splitValue = splitValue
        }
    }

}
