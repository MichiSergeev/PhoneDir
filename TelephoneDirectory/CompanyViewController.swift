//
//  CompanyViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 30.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class CompanyViewController: NSViewController {

    @IBOutlet weak var nameOfCompanyTF: NSTextField!
    @IBOutlet weak var phoneTF: NSTextField!
    @IBOutlet weak var emailTF: NSTextField!
    @IBOutlet weak var socialTF: NSTextField!
    @IBOutlet weak var formOfPropertyTF: NSTextField!
    
    weak var currentBook:UserBook!
    weak var bookVC:BookViewController!
    var id:TypeCards!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        // подготовка к инициализации нового экземпляра
        
        let name=nameOfCompanyTF.stringValue
        let mobile=phoneTF.stringValue
        let email=emailTF.stringValue
        let social=socialTF.stringValue
        
        
        
        // создание нового контакта (экземпляра класса Person)
        
        let newContact=bookVC.getContact(id: id, name: name, phone: mobile, email: email, social: social)
        extraInfofmation(contact: newContact as! Company)
        currentBook.addContact(newContact: newContact)
        bookVC.tableOfContacts.reloadData()
        bookVC.updateCountOfCards()
        view.window?.close()
        
    }
    
    private func extraInfofmation(contact:Company) {
        if !formOfPropertyTF.stringValue.isEmpty {
            contact.formOfProperty=formOfPropertyTF.stringValue
            contact.name!+=" "+formOfPropertyTF.stringValue
        }
    }
    
}
