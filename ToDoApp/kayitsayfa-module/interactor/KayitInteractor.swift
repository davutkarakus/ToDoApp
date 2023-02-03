//
//  KayitInteractor.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class KayitInteractor:KayitSayfaPresenterToInteractorProtocol {
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func kaydet(todo_description: String, todo_date: String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO ToDos (todo_description,todo_date) VALUES (?,?)", values: [todo_description,todo_date])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
