//
//  KayitPresenter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class KayitPresenter :KayitSayfaViewToPresenterProtocol{
    var interactor: KayitSayfaPresenterToInteractorProtocol?
    
    func kaydet(todo_description: String, todo_date: String) {
        interactor?.kaydet(todo_description: todo_description, todo_date: todo_date)
    }
}
