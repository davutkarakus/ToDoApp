//
//  DetayInteractor.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class DetayInteractor :DetaySayfaPresenterToInteractorProtocol{
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    func guncelle(todo_id: Int, todo_description: String, todo_date: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE ToDos SET todo_description = ? , todo_date = ? WHERE todo_id = ? ", values: [todo_description,todo_date,todo_id])
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
