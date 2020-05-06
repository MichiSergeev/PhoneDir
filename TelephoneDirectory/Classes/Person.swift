//
//  Person.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

class Person:Contact {
    var name: String?
    var mobile: String?
    var email: String?
    var socialNetwork: String?
    
    // необязательное (дополнительное) свойство
    var birthday:NSDate?
    
    var nameArray:[String]=["Стив Джобс", "Дональд Кнут", "Линус Торвальдс", "Бил Гейтс", "Бьерн Страуструп"]
    var mobileArray:[String]=["+71239874321", "+73217891234", "+41239876534", "+38763452198", "+00981234567"]
    var emailArray: [String]=["senior@developer.com", "junior@developer.com", "middle@developer.com", "pm@top.com", "teamlead@top.com"]
    var socialNetworkArray:[String]=["facebook/superman", "linkedIn/boss", "xing/leiter", "vk/monkeyproger", "ok/oldschool"]
    
    
    required init(name: String, mobile: String, email: String, socialNetwork: String) {
        self.name=name
        self.mobile=mobile
        self.email=email
        self.socialNetwork=socialNetwork
    }
    
    init() {
        self.createTestContact()
    }

    // необязательный (дополнительный) метод класса
    func beforeBirthday () -> String {
        guard let bday=birthday as Date? else {
            return "н/д"
        }
        let now=Date()
        let comps1=Calendar.current.dateComponents([.day, .month], from: bday)
        let comps2=Calendar.current.dateComponents([.day, .month], from: now)
        let dif=Calendar.current.dateComponents([.day], from: comps2, to: comps1)
        return "До дня рождения \(dif.day!) дней"
    }
}
