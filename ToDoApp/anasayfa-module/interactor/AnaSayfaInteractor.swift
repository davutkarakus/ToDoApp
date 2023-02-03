//
//  AnaSayfaInteractor.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class AnaSayfaInteractor : AnaSayfaPresenterToInteractorProtocol {
    var anaSayfaPresenter: AnaSayfaInteractorToPresenterProtocol?
    let db:FMDatabase?
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
        
    }
    func todosYukle() {
        var liste = [ToDos]()
        db?.open()
        do{
            let rs = try db!.executeQuery("SELECT * FROM ToDos", values: nil)
            
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))!
                let todo_description = rs.string(forColumn: "todo_description")!
                let todo_date = rs.string(forColumn: "todo_date")!
                
                let todo = ToDos(todo_id: todo_id, todo_description: todo_description, todo_date: todo_date)
                liste.append(todo)
            }
            anaSayfaPresenter?.presenteraVeriGonder(todoListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
       
    }
    
    func ara(aramaKelimesi: String) {
        var liste = [ToDos]()
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM ToDos WHERE todo_description like ?", values: ["%\(aramaKelimesi)%"])
            
            while rs.next() {
                let todo_id = Int(rs.string(forColumn: "todo_id"))!
                let todo_description = rs.string(forColumn: "todo_description")!
                let todo_date = rs.string(forColumn: "todo_date")!
                
                let todo = ToDos(todo_id: todo_id, todo_description: todo_description, todo_date: todo_date)
                liste.append(todo)
            }
            
            anaSayfaPresenter?.presenteraVeriGonder(todoListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func `sil`(todo_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM ToDos WHERE todo_id = ?", values: [todo_id])
            todosYukle()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    
}
