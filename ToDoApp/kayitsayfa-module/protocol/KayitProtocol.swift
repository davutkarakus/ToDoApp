//
//  KayitProtocol.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

protocol KayitSayfaViewToPresenterProtocol {
    var interactor:KayitSayfaPresenterToInteractorProtocol? {get set}
    func kaydet(todo_description:String,todo_date:String)
}
protocol KayitSayfaPresenterToInteractorProtocol {
    func kaydet(todo_description:String,todo_date:String)
}
protocol KayitSayfaPresenterToRouterProtocol {
    static func createModule(ref:ToDoKayit)
}
