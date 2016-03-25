//
//  UserController.swift
//  StandOFF
//
//  Created by Diego Aguirre on 3/24/16.
//  Copyright © 2016 home. All rights reserved.
//

import Foundation

class UserController {
    
    static var currentUser = User(username: "Diego", standup: [])
    
    func loginUser(email: String, password: String, completion: (user: User?) -> Void) {
        
    }
    
    func logOut() {
        
    }
    
    func fetchUserForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
    }
    
    static func createStandupForUser(var user: User) -> StandUp {
        let standUp = StandUpController.createStandUp()
        user.standups.append(standUp)
        user.save()
        return standUp
    }
    
    static func addStopToStandUpForUser(var user: User, standup: StandUp) {
        StandUpController.addStopToStandUp(standup)
        user.save()
    }
    
    
    
}