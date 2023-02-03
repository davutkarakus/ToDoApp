//
//  ToDo.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 1.02.2023.
//

import Foundation

class ToDos {
    
    var todo_id:Int?
    var todo_description:String?
    var todo_date:String?
    
    init(todo_id: Int, todo_description: String,todo_date:String) {
        self.todo_id = todo_id
        self.todo_description = todo_description
        self.todo_date = todo_date
    }
}
