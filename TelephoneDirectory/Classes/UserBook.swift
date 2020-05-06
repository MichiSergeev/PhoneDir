//
//  UserBook.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 22.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

class UserBook:Book {
    var userName: String
    var contactCards: [Contact] = []

    required init(userName: String) {
        self.userName=userName
    }
    
    func addContact(newContact: Contact) {
        self.contactCards.append(newContact)
    }
    func createTest() {
        var newContact:Contact?
        let numberOfContacts=Int.random(in: 3...10)
        var i=0
        while i<=numberOfContacts {
            let key=Int.random(in: 0...2)
            switch key {
            case 0:
                newContact=Person()
            case 1:
                newContact=Partner()
            case 2:
                newContact=Company()
            default:
                break
            }
            if !contactCards.contains(where: {$0.name==newContact?.name}) {
                i+=1
                self.addContact(newContact: newContact!)
            }
        }
    }
}
