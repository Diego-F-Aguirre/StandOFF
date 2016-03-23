//
//  DashBoardController.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var standUp: StandUp?
    
    @IBOutlet weak var totalStandupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DashBoardViewController.updateLabel), name: "secondTick", object: nil)
    }
    
    
    @IBAction func StartButtonPressed(sender: AnyObject) {
        timer.startTimer()
        timerLabel.text = timer.string
        StandUpController.createStandUp { (standUp) in
            StandUpController.standups.append(standUp)
            self.standUp = standUp
        }
    }
    
    @IBAction func StopButtonPressed(sender: AnyObject) {
        timer.stopTimer()
        timerLabel.text = ""
        if let standUp = standUp {
            StandUpController.addStopToStandUp(standUp)
            self.standUp = nil
            totalStandupLabel.text = StandUpController.secondsAsString(StandUpController.totalStandingTimeForStandups(StandUpController.standups))
        }
    }
    
    func updateLabel() {
        timerLabel.text = timer.string
    }
    
}

