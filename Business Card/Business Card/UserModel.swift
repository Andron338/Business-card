//
//  UserModel.swift
//  Business Card
//
//  Created by Magnise-2 on 7/9/19.
//  Copyright © 2019 Andrian Nebeso. All rights reserved.
//

import Foundation

class User{
    public var currentLocation: String
    public var birthdayDate: String
    public var originalLocation: String
    public var phoneNumber: String
    public var userBiography: String
    public var studiedAt: String
    init(currentLocation:String, birthdayDate: String, originalLocation: String, phoneNumber: String, userBiography: String, studiedAt: String) {
        self.currentLocation = currentLocation
        self.birthdayDate = birthdayDate
        self.originalLocation = originalLocation
        self.phoneNumber = phoneNumber
        self.userBiography = userBiography
        self.studiedAt = studiedAt
    }
    
    init(){
        self.currentLocation = ""
        self.birthdayDate = ""
        self.originalLocation = ""
        self.phoneNumber = ""
        self.userBiography = ""
        self.studiedAt = ""
    }
    
    init(userDefaults: UserDefaults){
        currentLocation = userDefaults.object(forKey: "currentLocation") as? String ?? "Ternopil"
        birthdayDate = userDefaults.object(forKey: "birthdate") as? String ?? "February 1, 1999"
        originalLocation = userDefaults.object(forKey: "oiginalLocation") as? String ?? "Lviv"
        phoneNumber = userDefaults.object(forKey: "phoneNumber") as? String ?? "+380955454545"
        userBiography = userDefaults.object(forKey: "biography") as? String ?? "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        studiedAt = userDefaults.object(forKey: "studiedAt") as? String ?? "TNTU"
    }
    
    func saveToUserDefaults(userDefaults: UserDefaults) {
        userDefaults.set(currentLocation, forKey: "currentLocation")
        userDefaults.set(birthdayDate, forKey: "birthdate")
        userDefaults.set(originalLocation, forKey: "oiginalLocation")
        userDefaults.set(phoneNumber, forKey: "phoneNumber")
        userDefaults.set(userBiography, forKey: "biography")
        userDefaults.set(studiedAt, forKey: "studiedAt")
        
    }
}
