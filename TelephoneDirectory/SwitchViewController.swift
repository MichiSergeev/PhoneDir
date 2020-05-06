//
//  SwitchViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 30.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class SwitchViewController: NSViewController {
    
    weak var currentBook:UserBook!
    weak var bookVC:BookViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if let newVC=segue.destinationController as? PersonViewController {
            newVC.currentBook=currentBook
            newVC.bookVC=bookVC
            newVC.id = .person
        }
        
        if let newVC=segue.destinationController as? PartnerViewController {
            newVC.currentBook=currentBook
            newVC.bookVC=bookVC
            newVC.id = .partner
        }
        
        if let newVC=segue.destinationController as? CompanyViewController {
            newVC.currentBook=currentBook
            newVC.bookVC=bookVC
            newVC.id = .company
        }
    }
    
}
