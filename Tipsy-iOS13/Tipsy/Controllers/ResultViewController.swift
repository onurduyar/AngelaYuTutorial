//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Onur Duyar on 15.02.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalValue: Double?
    var splitValue: Double?
    var tipValue: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let splitText = String(format: "%.0f", splitValue!)
        let tipText = String(format: "%.0f", tipValue!)
        settingsLabel.text = "Split between \(splitText) people, with \(tipText)% tip."
        totalLabel.text = String(format: "%.2f", totalValue!)
   
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
