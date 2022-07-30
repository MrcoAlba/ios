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
    
    let eggMinutes = ["Soft":1,"Medium":2,"Hard":3]
    var runCount : Float = 0
    var runTotal : Float = 0
    var timer = Timer()
    var alarm : AVAudioPlayer?
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    @IBAction func HardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        TitleLabel.text = "Preparing \(sender.currentTitle!) :)"
        runCount = Float(60 * eggMinutes[sender.currentTitle!]!)
        runTotal = Float(60 * eggMinutes[sender.currentTitle!]!)
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer(){
        if runCount > 0{
            TimerLabel.text = secondsToHoursMinutesSeconds(Int(runCount))
            ProgressView.progress = Float(1 - runCount/runTotal)
        }else if runCount == 0 {
            TimerLabel.text = "TIME OUT!!!"
            TitleLabel.text = "DONE!"
            playSound(resource: "alarm_sound", extension: "mp3")
        }else if runCount < -10 {
            TimerLabel.text = "00:00:00"
            TitleLabel.text = "How do you like your eggs?"
            ProgressView.progress = 0
            timer.invalidate()
        }
        runCount -= 1
    }
    
    func playSound(resource:String,extension:String){
        let url = Bundle.main.url(forResource: resource, withExtension:`extension`)
        alarm = try! AVAudioPlayer(contentsOf: url!)
        alarm?.play()
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        let rhours = seconds / 3600 >= 10 ? "\(seconds / 3600)" : "0\(seconds / 3600)"
        let rminutes = (seconds % 3600) / 60 >= 10 ? "\((seconds % 3600) / 60)" : "0\((seconds % 3600) / 60)"
        let rseconds = (seconds % 3600) % 60 >= 10 ? "\((seconds % 3600) % 60)" : "0\((seconds % 3600) % 60)"
        return "\(rhours):\(rminutes):\(rseconds)"
    }
}
