//
//  BookViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 23.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class BookViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
    
    private enum Property {
        case name
        case mobile
        case email
        case social
        case className
    }
    
    var index:Int?

    weak var currentBook:UserBook!
    
    @IBOutlet weak var resultCheckEmail: NSTextField!
    @IBOutlet weak var resultBirthday: NSTextField!
    @IBOutlet weak var resultOverloading: NSTextField!
    @IBOutlet weak var tableOfContacts: NSTableView!
    @IBOutlet weak var userNameLabel: NSTextField!
    @IBOutlet weak var countOfConacts: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.styleMask=[.closable, .titled]
        userNameLabel.stringValue=currentBook.userName
        updateCountOfCards()
        tableOfContacts.selectRowIndexes(.init(arrayLiteral: 0), byExtendingSelection: true)
    }
    
    override func viewWillDisappear() {
        view.window?.close()
    }
    
    func updateCountOfCards() {
        countOfConacts.stringValue=String(currentBook.contactCards.count)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if let id=tableColumn?.identifier.rawValue {
            switch id {
            case "nameID":
                return cell(forColumnWithIdentifier: id, book: currentBook!, property: .name, column: 0, row: row)
            case "phoneID":
                return cell(forColumnWithIdentifier: id, book: currentBook!, property: .mobile, column: 1, row: row)
            case "emailID":
                return cell(forColumnWithIdentifier: id, book: currentBook!, property: .email, column: 2, row: row)
            case "socialID":
                return cell(forColumnWithIdentifier: id, book: currentBook!, property: .social, column: 3, row: row)
            case "classID":
                return cell(forColumnWithIdentifier: id, book: currentBook!, property: .className, column: 4, row: row)
            default:
                return nil
            }
        } else {
            return nil
        }
    }
    
    // вспомагательный метод
    private func cell(forColumnWithIdentifier columnIdentifier: String, book:UserBook, property:Property, column:Int, row:Int) -> NSView {
        let cell=tableOfContacts.makeView(withIdentifier: .init(rawValue: columnIdentifier), owner: self) as! NSTableCellView
        switch property {
        case .name:
            cell.textField?.stringValue=book.contactCards[row].name!
        case .mobile:
            cell.textField?.stringValue=book.contactCards[row].mobile!
        case .email:
            cell.textField?.stringValue=book.contactCards[row].email!
        case .social:
            cell.textField?.stringValue=book.contactCards[row].socialNetwork!
        case .className:
            cell.textField?.stringValue=String(String(describing: book.contactCards[row]).split(separator: ".")[1])
        }
        return cell
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        guard let book=currentBook else {
            return 0
        }
        return book.contactCards.count
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let newVC=segue.destinationController as? SwitchViewController {
            newVC.currentBook=currentBook
            newVC.bookVC=self
        }
    }
    
    func getContact(id:TypeCards, name:String, phone:String, email:String, social:String)->Contact {
        let newContact:Contact!
        switch id {
        case .person:
            newContact=Person(name: name, mobile: phone, email: email, socialNetwork: social)
        case .partner:
            newContact=Partner(name: name, mobile: phone, email: email, socialNetwork: social)
        case .company:
            newContact=Company(name: name, mobile: phone, email: email, socialNetwork: social)
        }
        return newContact
    }
    
    
    
    @IBAction func selectedRowAction(_ sender: NSTableView) {
        resultCheckEmail.stringValue=""
        let index=sender.selectedRow
        self.index=index
    }
    
    @IBAction func checkEmailAction(_ sender: Any) {
        
        guard tableOfContacts.selectedRow != -1 else {
            return
        }
        
        resultCheckEmail.stringValue = String( currentBook.contactCards[tableOfContacts.selectedRow].checkEmail())
    }
    @IBAction func deleteRowAction(_ sender: NSTableView) {
        guard tableOfContacts.selectedRow != -1 else {
            return
        }
        
        let index=tableOfContacts.selectedRow
        let indexSet=tableOfContacts.selectedRowIndexes
        currentBook.contactCards.remove(at: index)
        tableOfContacts.removeRows(at: indexSet, withAnimation: .effectFade)
        countOfConacts.stringValue=String(currentBook.contactCards.count)
        tableOfContacts.reloadData()
        tableOfContacts.selectRowIndexes(.init(arrayLiteral: 0), byExtendingSelection: true)
        
    }
    
    @IBAction func overloadingAction(_ sender: Any) {
        let cards=currentBook.contactCards
        var hitArray:[Contact]=[]
        for i in 0..<currentBook.contactCards.count-1 {
            for j in i+1..<currentBook.contactCards.count {
                if cards[i]==cards[j] {
                    hitArray.append(cards[i])
                }
            }
        }
        resultOverloading.stringValue="Одинаковых имен: \(hitArray.count)"
    }
    
    @IBAction func resultBirthday(_ sender: Any) {
        guard tableOfContacts.selectedRow != -1 else {
            return
        }
        let i=tableOfContacts.selectedRow
        if let contact=currentBook.contactCards[i] as? Person {
            resultBirthday.stringValue = contact.beforeBirthday()
        } else {
            resultBirthday.stringValue="метод только для Person!"
        }
    }
}
