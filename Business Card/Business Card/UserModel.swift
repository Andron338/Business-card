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
        currentLocation = userDefaults.object(forKey: "currentLocation") as? String ?? ""
        birthdayDate = userDefaults.object(forKey: "birthdate") as? String ?? ""
        originalLocation = userDefaults.object(forKey: "oiginalLocation") as? String ?? ""
        phoneNumber = userDefaults.object(forKey: "phoneNumber") as? String ?? ""
        userBiography = userDefaults.object(forKey: "biography") as? String ?? ""
        studiedAt = userDefaults.object(forKey: "studiedAt") as? String ?? ""
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
