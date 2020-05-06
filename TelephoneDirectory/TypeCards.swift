//
//  TypeCards.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 02.05.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Foundation

// перечисление указывает экземпляр какого класса нужно создавать

enum TypeCards {
    case person
    case partner
    case company
}

// перегрузка оператора == для типа данных Contact (это протокол)

func == (firstContact:Contact, secondContact:Contact)->Bool {
    if let name1=firstContact.name, let name2=secondContact.name {
        if name1 == name2 {
            return true
        }
    }
    return false
}
