//
//  AnaSayfaRouter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class AnaSayfaRouter:AnaSayfaPresenterToRouterProtocol {
    static func createModule(ref: AnaSayfa) {
        let presenter = AnaSayfaPresenter()
        
        //View
        ref.anaSayfaPresenterNesnesi = presenter
        //Presenter
        ref.anaSayfaPresenterNesnesi?.anaSayfaInteractor = AnaSayfaInteractor()
        ref.anaSayfaPresenterNesnesi?.anaSayfaView = ref
        //Interactor
        ref.anaSayfaPresenterNesnesi?.anaSayfaInteractor?.anaSayfaPresenter = presenter
    }
}
