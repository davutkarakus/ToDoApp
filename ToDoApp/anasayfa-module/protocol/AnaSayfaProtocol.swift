//
//  AnaSayfaProtocol {.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

//Ana Protocol
protocol AnaSayfaViewToPresenterProtocol {
    var anaSayfaInteractor : AnaSayfaPresenterToInteractorProtocol? {get set}
    var anaSayfaView : AnaSayfaPresenterToViewProtocol? {get set}
    func todosYukle()
    func ara(aramaKelimesi:String)
    func sil(todo_id:Int)
    
}
protocol AnaSayfaPresenterToInteractorProtocol {
    var anaSayfaPresenter : AnaSayfaInteractorToPresenterProtocol? {get set}
    
    func todosYukle()
    func ara(aramaKelimesi:String)
    func sil(todo_id:Int)
    
}

//Taşıyıcı Protocol
protocol AnaSayfaInteractorToPresenterProtocol {
    func presenteraVeriGonder(todoListesi:[ToDos])
    
}
protocol AnaSayfaPresenterToViewProtocol {
    func vieweVeriGonder(todoListesi:[ToDos])
}

//Router Protocol
protocol AnaSayfaPresenterToRouterProtocol {
    static func createModule(ref:AnaSayfa)
}
