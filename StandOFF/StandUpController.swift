//
//  StandUpController.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/23/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation

class StandUpController {
    static var standups: [StandUp] = []
    
    static func createStandUp(completion:(standUp: StandUp)->Void) {
        let standUp = StandUp(startTime: NSDate(), stopTime: nil)
        completion(standUp: standUp)
    }
    
    static func addStopToStandUp(standUp: StandUp) {
        standUp.stopTime = NSDate()
    }
    
    static func totalStandingTimeForStandups(standUps: [StandUp]) -> Double {
        var total: Double = 0
        for standUp in standUps {
            if let time = standUp.timeStanding {
                total += time
            }
        }
        return total
    }
    
    static func secondsAsString(seconds: Double) -> String {
        let totalSeconds = Int(seconds)
        
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