//
//  DetayProtocol.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

protocol DetaySayfaViewToPresenterProtocol {
    var detayInteractor:DetaySayfaPresenterToInteractorProtocol? {get set}
    func guncelle(todo_id:Int,todo_description:String,todo_date:String)
}
protocol DetaySayfaPresenterToInteractorProtocol {
    func guncelle(todo_id:Int,todo_description:String,todo_date:String)
}
protocol DetaySayfaPresenterToRouterProtocol {
    static func createModule(ref:ToDoDetay)
}
