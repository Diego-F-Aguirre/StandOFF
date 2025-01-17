//
//  Timer.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/21/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class Timer: NSObject {

    var seconds = NSTimeInterval(0)
    var totalSeconds = NSTimeInterval(0)
    private var timer: NSTimer?
    var delegate: TimerDelegate?
    var timerIsOn: Bool {
        get {
            if timer != nil {
                return true
            } else {
                return false
            }
        }
    }
    
    var string: String {
        get {
            let totalSeconds = Int(self.seconds)
            
            let hours = totalSeconds / 3600
            let minutes = (totalSeconds - (hours * 3600)) / 60
            let seconds = totalSeconds - (hours * 3600) - (minutes * 60)
            
            var hoursString = ""
            if hours > 0 {
                hoursString = "\(hours):"
            }
            
            var minutesString = ""
            if minutes < 10 {
                minutesString = "0\(minutes):"
            } else {
                minutesString = "\(minutes):"
            }
            
            var secondsString = ""
            if seconds < 10 {
                secondsString = "0\(seconds)"
            } else {
                secondsString = "\(seconds)"
            }
            
            return hoursString + minutesString + secondsString
        }
    }
    
    func setTimer(seconds: NSTimeInterval, totalSeconds: NSTimeInterval) {
        self.seconds = seconds
        self.totalSeconds = totalSeconds
    }
    
    func startTimer() {
        if !timerIsOn {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(Timer.updateTimer), userInfo: nil, repeats: true)
            
        }
    }
    
    
    func stopTimer() {
        if timerIsOn {
            timer?.invalidate()
            timer = nil
            seconds = 0
            totalSeconds = 0
        }
    }
    
    func updateTimer() {
        seconds += 1
        //NSNotificationCenter.defaultCenter().postNotificationName("secondTick", object: self)
        delegate?.updateLabel(StandUpController.secondsAsString(self.seconds))
    }
    
    
}

protocol TimerDelegate {
    func updateLabel(label: String)
}
