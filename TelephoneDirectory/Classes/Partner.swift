//
//  Partner.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

class Partner:Contact {
    
    var name: String?
    var mobile: String?
    var email: String?
    var socialNetwork: String?
    
    // необязательное (дополнительное) свойство
    var gm:String?
    var company:String?
    
    var nameArray:[String]=["Иван Иванов", "Петр Петров", "Сидор Сидоров", "Сергей Сергеев", "Михаил Михайлов"]
    var mobileArray:[String]=["+7123987", "+7321789", "+4123987", "+38763452198", "+0098123"]
    var emailArray: [String]=["dev@senior.com", "jun@junior.com", "mid@dev.com", "project@manager.com", "team@lead.com"]
    var socialNetworkArray:[String]=["linkedIn/user1", "linkedIn/user2", "linkedIn/user3", "linkedIn/user4", "linkedIn/user5"]
    
    required init(name: String, mobile: String, email: String, socialNetwork: String) {
        self.name=name
        self.mobile=mobile
        self.email=email
        self.socialNetwork=socialNetwork
    }
    
    init() {
        self.createTestContact()
    }
}
