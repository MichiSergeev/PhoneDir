//
//  PartnerViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 30.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class PartnerViewController: NSViewController {
    
    

    @IBOutlet weak var firstNameTF: NSTextField!
    @IBOutlet weak var secondNameTF: NSTextField!
    @IBOutlet weak var phoneTF: NSTextField!
    @IBOutlet weak var companyTF: NSTextField!
    @IBOutlet weak var emailTF: NSTextField!
    @IBOutlet weak var socialTF: NSTextField!
    @IBOutlet weak var gmTF: NSTextField!

    
    weak var currentBook:UserBook!
    weak var bookVC:BookViewController!
    var id:TypeCards!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        // подготовка к инициализации нового экземпляра
        
         let name=[firstNameTF.stringValue, secondNameTF.stringValue].filter({!$0.isEmpty}).joined(separator: " ")
        
        let mobile=phoneTF.stringValue
        let email=emailTF.stringValue
        let social=socialTF.stringValue
        
        
        
        // создание нового контакта (экземпляра класса Person)
        
        let newContact=bookVC.getContact(id: id, name: name, phone: mobile, email: email, social: social)
        extraInfofmation(contact: newContact as! Partner)
        currentBook.addContact(newContact: newContact)
        bookVC.updateCountOfCards()
        bookVC.tableOfContacts.reloadData()
        view.window?.close()
        
    }
    
    private func extraInfofmation(contact:Partner) {
        if !gmTF.stringValue.isEmpty {
            contact.gm=gmTF.stringValue
        }
        if !companyTF.stringValue.isEmpty {
            contact.company=companyTF.stringValue
        }
    }
    
}
