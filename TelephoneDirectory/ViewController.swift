//
//  ViewController.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 16.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var segmentedControl: NSSegmentedControl!
    @IBOutlet weak var entryButton: NSButtonCell!
    @IBOutlet weak var listOfUsers: NSComboBox!
    
    var books:[String:UserBook]=[:]
    var currentUser:String=""
    var numberTestUser:Int=0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.styleMask=[.closable, .titled]
        view.window?.title="Телефонная книга"
    }
    
    override func viewDidDisappear() {
      NSApplication.shared.terminate(self)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        
        if let newVC=segue.destinationController as? UserSignIn {
            newVC.startVC=self
        }
        
        if let newVC=segue.destinationController as? BookViewController {
            newVC.currentBook=books[currentUser]
        }
    }
    
    func addNewBook(_ newBook:UserBook) {
        currentUser=newBook.userName
        books[currentUser]=newBook
        listOfUsers.addItem(withObjectValue: currentUser)
        listOfUsers.selectItem(at: listOfUsers.numberOfItems-1)
    }
    
    @IBAction func entryOrSignIn(_ sender: NSSegmentedControl) {
        if sender.selectedSegment==1 {
            performSegue(withIdentifier: "showSignIn", sender: sender)
        }
    }
    
    
    @IBAction func entryButtonAction(_ sender: Any) {
        guard listOfUsers.numberOfItems != 0 else {
            return
        }
        performSegue(withIdentifier: "showBook", sender: sender)
    }
    
    @IBAction func testDrive(_ sender: Any) {
        // индекс пользователя
        numberTestUser+=1
        // создаем книгу для нового пользователя
        let testBook=UserBook(userName: "Demo User "+"\(numberTestUser)")
        // запускает метод демо в этой книге
        testBook.createTest()
        addNewBook(testBook)
    }
    @IBAction func chooseUser(_ sender: NSComboBox) {

        if let selectedUser=listOfUsers.objectValueOfSelectedItem as? String {
            currentUser=selectedUser
        }
    }
}

