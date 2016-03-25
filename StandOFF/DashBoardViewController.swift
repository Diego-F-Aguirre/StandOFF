//
//  DashBoardController.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController, TimerDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()
    var standUp: StandUp?
    
    @IBOutlet weak var totalStandupLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(DashBoardViewController.updateLabel), name: "secondTick", object: nil)
    }
    
    
    @IBAction func StartButtonPressed(sender: AnyObject) {
        timer.delegate = self
        timer.startTimer()
        timerLabel.text = timer.string
        self.standUp = UserController.createStandupForUser(UserController.currentUser)
    }
    
    @IBAction func StopButtonPressed(sender: AnyObject) {
        timer.stopTimer()
        timerLabel.text = ""
        if let standUp = standUp {
            UserController.addStopToStandUpForUser(UserController.currentUser, standup: standUp)
            self.standUp = nil
            totalStandupLabel.text = StandUpController.secondsAsString(StandUpController.totalStandingTimeForStandups(UserController.currentUser.standups))
        }
    }
    
//    func updateLabel() {
//        timerLabel.text = timer.string
//    }
    
    func updateLabel(label: String) {
        timerLabel.text = label
    }
    
}

