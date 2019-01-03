//
//  ViewController.swift
//  TimerCountDownApp
//
//  Created by MAC on 2/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var seconds = 30
    var timer = Timer()
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        lblTime.text = String(seconds)
    }
    
    @IBAction func btnStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    @IBAction func btnStop(_ sender: Any) {
        timer.invalidate()
        seconds = 30
        slider.setValue(30, animated: true)
        lblTime.text = "30"
    }
    
    @objc func counter()
    {
        seconds -= 1
        lblTime.text = String(seconds)
        
        if (seconds == 0)
        {
            timer.invalidate()
            //audioPlayer.play()
        }
    }
    
}

