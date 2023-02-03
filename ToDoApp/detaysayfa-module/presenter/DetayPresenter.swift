//
//  DetayPresenter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class DetayPresenter:DetaySayfaViewToPresenterProtocol{
    var detayInteractor: DetaySayfaPresenterToInteractorProtocol?
    
    func guncelle(todo_id: Int, todo_description: String, todo_date: String) {
        detayInteractor?.guncelle(todo_id: todo_id, todo_description: todo_description, todo_date: todo_date)
    }
}
