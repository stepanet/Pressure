//
//  ViewController.swift
//  Pressure
//
//  Created by Dmitry Pyatin on 08.12.15.
//  Copyright © 2015 Dmitry Pyatin. All rights reserved.
//

import UIKit

@IBDesignable

class ViewController: UIViewController {

    @IBOutlet weak var speedView: SpeedView!
    @IBOutlet weak var speedView2: SpeedView!
    @IBOutlet weak var speedView3: SpeedView!
    @IBOutlet weak var startTimer: UISwitch!
    @IBOutlet weak var slider: UISlider!
    
    
    var timer:Timer?
    var endAngel:CGFloat = 180
    var alpha:CGFloat = 0.00

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sliderChangeValue(_ sender: UISlider) {
        print(sender.value)
        self.speedView.rotation = -CGFloat(sender.value * 180)
        self.speedView.setNeedsDisplay()
        
    }
    
    @objc func coutGo() {
        print("Timer fired!")
        let arrayView = [speedView,speedView2,speedView3]
        
        for each in arrayView {
            each!.rotation = CGFloat(endAngel)

            each!.color = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
            each!.setNeedsDisplay()
            endAngel = endAngel - 0.1
            alpha = alpha + 0.0006
            

//            print("угол: \(endAngel) , alpha: \(alpha)")
            
            if endAngel < 0.1 {
                startTimer.isOn = false
                timer?.invalidate()
                endAngel = 180
                alpha = 0.00
            }
        }
    }
    
    @IBAction func startOn(_ sender: Any) {
        
        if startTimer.isOn {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(coutGo), userInfo: nil, repeats: true)
        } else {

            timer?.invalidate()
            endAngel = 180
            alpha = 0.00
        }
    }
    
    

    @IBAction func ChangePressure(_ sender: UISlider) {
    
        print("sender.value \(sender.value)")
        
        if sender.value == -90 {
            sender.value = -89.9
        }
                
        let arrayView = [speedView,speedView2,speedView3]
        
        for each in arrayView {
            each!.rotation = CGFloat(sender.value)
            if sender.value < 0 {
                each!.color = .red
            } else {
                each!.color = .green
            }
            
            each!.setNeedsDisplay()
        }

    }
}

