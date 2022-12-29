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
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    @IBOutlet var progressbar: UIProgressView!
    
    @IBOutlet weak var text: UILabel!
    let a = ["Soft" : 3,"Medium" : 4, "Hard" : 7]
    var prog: Float = 0
    var totalprog: Float = 0
    var player: AVAudioPlayer!
    var timer = Timer()
    var c: String = "C"
    @IBAction func hardnessSlected(_ sender: UIButton) {
        
       
        timer.invalidate()
        progressbar.progress=0
        prog = 0.0
        text.text = "hardness"
        let c = sender.currentTitle!
        totalprog = Float(a[c]!)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        
        
        }
        @objc func update(){
        if prog < totalprog{
            prog+=1
            let progper = prog/totalprog
            progressbar.progress = Float(progper)
            print(Float(progper))
            if progressbar.progress == 1.0{
                playSound()
                
            }
            
        }
        else  { timer.invalidate()
                self.text.text = "Done"
                
            }
        }
        func playSound() {
               
               
               let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
               player = try! AVAudioPlayer(contentsOf: url!)
               player.play()
            
        }
    
    

    


}
