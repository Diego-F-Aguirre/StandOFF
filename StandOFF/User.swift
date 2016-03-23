//
//  User.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/22/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation

class User: Equatable {
    
    private let kUsername = "username"
    private let kStandUp = "standup"
    
    let username: String
    let identifier: String?
//    var challenges: [Challenge] = []
    var standups: [StandUp]
//    let challengesIDs: [String]
    var endpoint: String {
        return "users"
    }
    
    var jsonValue: [String: AnyObject] {
        
        return [kUsername: username, kStandUp: standups]
    }
    
    init (username: String, standup: [StandUp]) {
        self.username = username
        self.standups = standup
        self.identifier = nil
        
    }
    
    init?(json:[String: AnyObject], identifier: String) {
        
        guard let username = json[kUsername] as? String,
            let standup = json[kStandUp] as? [StandUp] else { return nil }
        
        self.username = username
        self.standups = standup
        self.identifier = identifier
    }
    
}

func ==(lhs: User, rhs: User) -> Bool {
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}