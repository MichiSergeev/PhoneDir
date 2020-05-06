//
//  UserSignIn.swift
//  TelephoneDirectory
//
//  Created by Mikhail Sergeev on 23.04.2020.
//  Copyright © 2020 Mikhail Sergeev. All rights reserved.
//

import Cocoa

class UserSignIn: NSViewController {
    
    @IBOutlet weak var firstName: NSTextField!
    @IBOutlet weak var lastName: NSTextField!
    
    weak var startVC:ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        view.window?.styleMask=[.closable, .titled]
        view.window?.title="Регистрация нового пользователя"
    }
    
    @IBAction func signInButton(_ sender: Any) {
        startVC.segmentedControl.selectedSegment=0
        // проверка на наличие текста в полях
        guard !firstName.stringValue.isEmpty, !lastName.stringValue.isEmpty else {
            performSegue(withIdentifier: "showWarning", sender: sender)
            return
        }
        // пока создаем просто имя пользователя для последующей проверки
        let newUser=(firstName.stringValue + " " + lastName.stringValue).capitalized
        // проверка одноименных пользователей
        guard !startVC.books.keys.contains(newUser) else {
            performSegue(withIdentifier: "showWarning", sender: sender)
            return
        }
        // вот теперь создаем новую книгу
        let newBook=UserBook(userName: newUser)
        // записываем ее в словарь
        startVC.addNewBook(newBook)
        // переходим в просмотр книги
        startVC.entryButtonAction(self)
        // покидаем это окно в конце
        view.window?.close()
    }
}
