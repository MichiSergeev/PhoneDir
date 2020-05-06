//
//  Contact.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

protocol Contact:class {
    
    var name:String? {get set}
    var mobile:String? {get set}
    var email:String? {get set}
    var socialNetwork:String? {get set}
    
    var nameArray:[String] {get}
    var mobileArray:[String] {get}
    var emailArray: [String] {get}
    var socialNetworkArray:[String] {get}
    init(name:String, mobile:String, email:String, socialNetwork:String)
}


extension Contact {
    // методы, одинаково реализуемые во всех классах
    
    func checkEmail() -> Bool {
        if let email=self.email {
            guard email.contains("@"), !email.contains(" "),
                email.split(separator: "@").count==2
                else {
                    return false
            }
        }
        return true
    }
    
    func createTestContact() {
        let random=Int.random(in: 0...4)
        self.name=self.nameArray[random]
        self.mobile=self.mobileArray[random]
        self.email=self.emailArray[random]
        self.socialNetwork=self.socialNetworkArray[random]
    }
    
}
