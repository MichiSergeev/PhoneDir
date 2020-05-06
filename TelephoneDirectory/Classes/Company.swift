//
//  Company.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

class Company:Contact {
    var name: String?
    var mobile: String?
    var email: String?
    var socialNetwork: String?
    
    // необязательное (дополнительное) свойство
    var formOfProperty:String?
    
    var nameArray:[String]=["ООО Яблоко", "ПАО Алгоритм", "НАО Линукс", "Майк и кроссофт", "ИП Андроид"]
    var mobileArray:[String]=["+739874321", "+717891234", "+439876534", "+363452198", "+081234567"]
    var emailArray: [String]=["info@developer.com", "info@developer.com", "info@developer.com", "info@top.com", "info@top.com"]
    var socialNetworkArray:[String]=["www.google.com", "www.apple.com", "www.yandex.ru", "www.rambler.ru", "www.vstu.ru"]
    
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
