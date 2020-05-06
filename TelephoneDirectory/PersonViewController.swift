//
//  PersonViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 30.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class PersonViewController: NSViewController {
    
    
    weak var currentBook:UserBook!
    weak var bookVC:BookViewController!
    var id:TypeCards!
    
    @IBOutlet weak var familyNameTF: NSTextField!
    @IBOutlet weak var nameTF: NSTextField!
    @IBOutlet weak var patronymicTF: NSTextField!
    @IBOutlet weak var phoneTF: NSTextField!
    @IBOutlet weak var emailTF: NSTextField!
    @IBOutlet weak var socialTF: NSTextField!
    @IBOutlet weak var birthdayTF: NSTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        // подготовка к инициализации нового экземпляра
        let name=[nameTF.stringValue, patronymicTF.stringValue, familyNameTF.stringValue].filter({!$0.isEmpty}).joined(separator: " ")
        
        
        let mobile=phoneTF.stringValue
        let email=emailTF.stringValue
        let social=socialTF.stringValue
        
        
        // создание нового контакта (экземпляра класса Person)
        
        let newContact=bookVC.getContact(id: id, name: name, phone: mobile, email: email, social: social)
        extraInfofmation(contact: newContact as! Person)
        currentBook.addContact(newContact: newContact)
        bookVC.updateCountOfCards()
        bookVC.tableOfContacts.reloadData()
        view.window?.close()
        
    }
    
    private func extraInfofmation(contact:Person) {
        // проверка дня рождения
        if !birthdayTF.stringValue.isEmpty {
            let df=DateFormatter()
            df.dateFormat="d.M.y"
            contact.birthday=df.date(from: birthdayTF.stringValue) as NSDate?
        }
    }
    
}
