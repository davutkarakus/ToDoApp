//
//  AnaSayfaPresenter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class AnaSayfaPresenter :   AnaSayfaViewToPresenterProtocol {
    var anaSayfaInteractor: AnaSayfaPresenterToInteractorProtocol?
    
    var anaSayfaView: AnaSayfaPresenterToViewProtocol?
    
    func todosYukle() {
        anaSayfaInteractor?.todosYukle()
    }
    
    func ara(aramaKelimesi: String) {
        anaSayfaInteractor?.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func `sil`(todo_id: Int) {
        anaSayfaInteractor?.sil(todo_id: todo_id)
    }
    
    
}
extension AnaSayfaPresenter : AnaSayfaInteractorToPresenterProtocol {
    func presenteraVeriGonder(todoListesi: [ToDos]) {
        anaSayfaView?.vieweVeriGonder(todoListesi: todoListesi)
    }
}
