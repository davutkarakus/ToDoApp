//
//  DetayRouter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class DetayRouter:DetaySayfaPresenterToRouterProtocol {
    static func createModule(ref: ToDoDetay) {
        ref.presenterNesnesi = DetayPresenter()
        ref.presenterNesnesi?.detayInteractor = DetayInteractor()
        
    }
}
