//
//  ViewController.swift
//  StopWatch
//
//  Created by Wilson Wang on 2/16/17.
//  Copyright © 2017 Wilson Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var startTime:Date?
    func startDate() {
        startTime = Date()
    }
    
    var TimerObject = Timer()
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBAction func Start(_ sender: UIButton) {
        let WSelector : Selector = #selector(ViewController.updatetime)
        TimerObject = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                           selector: WSelector,
                                           userInfo: nil,
                                           repeats: true)
        startDate()
    }
    
    func updatetime(_ timer: Timer) {
        let timeInterval = -((startTime?.timeIntervalSinceNow)!)
        print(timeInterval)
        let minutes = Int(floor(timeInterval/60))
        let seconds = Int(round((timeInterval.truncatingRemainder(dividingBy: 60))))
        let milliseconds = Int(timeInterval.truncatingRemainder(dividingBy: 1) * 100)
        let calculatedTime = String(format: "%02d:%02d:%d", minutes, seconds, milliseconds)
        TimeLabel.text = calculatedTime
    }
    
    @IBAction func Stop(_ sender: UIButton) {
        TimerObject.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

