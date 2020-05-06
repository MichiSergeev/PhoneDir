//
//  Book.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

//абстрактный класс фабрики

protocol Book:class {
    var userName:String {get}
    var contactCards:[Contact] {get set}
    init(userName:String)
    func addContact(newContact:Contact)->()
}
