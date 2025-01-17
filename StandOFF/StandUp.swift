//
//  StandUps.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import UIKit

class StandUp {
    
    private let kStartTime = "startTime"
    private let kStopTime = "stopTime"
    
    //let user: User
    let startTime: NSDate
    var stopTime: NSDate?
    let identifier: String?
    var timeStanding: NSTimeInterval? {
        if let stopTime = stopTime {
            return stopTime.timeIntervalSinceDate(startTime)
        }
        return nil
    }
    var endpoint: String {
        return "standingTimes"
    }
    var age: NSTimeInterval {
        return NSDate().timeIntervalSinceDate(startTime)
    }
    
    var jsonValue: [String: AnyObject] {
        
        var json: [String: AnyObject] = [kStartTime: startTime.timeIntervalSince1970]
        if let stopTime = stopTime {
            json[kStopTime] = stopTime.timeIntervalSince1970
        }
        return json
    }
    
    init(startTime: NSDate, stopTime: NSDate?){
//        self.user = user
        self.startTime = startTime
        self.stopTime = stopTime
        self.identifier = nil
    }
    
//    init?(json: [String: AnyObject], identifier: String){
//        guard let startTime = json[kStartTime] as? NSDate,
//            let stopTime = json[kStopTime] as? NSDate else { return nil }
//        
//        self.identifier = identifier
//        self.startTime = startTime
//        self.stopTime = stopTime
//    }
}
