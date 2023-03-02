//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var timer = Timer()

    let eggTimes : [String : Int] = ["Soft" : 5,"Medium": 8, "Hard" : 12]
    
    var totalTime = 60
    var secondsPassed = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        progressBar.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        reset()
        
        totalTime = eggTimes[hardness]! * 60
        label.text = hardness + " \(eggTimes[hardness]!) min."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed <= totalTime {
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
            secondsPassed += 1
        }else {
            playSound(name: "alarm_sound")
            timer.invalidate()
            label.text = "Done!"
        }
    }
    
    func reset() {
        timer.invalidate()
        progressBar.progress = 0
        secondsPassed = 0
    }
    
    func playSound(name: String?) {
        let url = Bundle.main.url(forResource: name, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
    }
    
}
