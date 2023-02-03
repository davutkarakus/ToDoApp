//
//  KayitRouter.swift
//  ToDoApp
//
//  Created by Davut Karakuş on 3.02.2023.
//

import Foundation

class KayitRouter :KayitSayfaPresenterToRouterProtocol{
    static func createModule(ref: ToDoKayit) {
        ref.presenterNesnesi = KayitPresenter()
        ref.presenterNesnesi?.interactor = KayitInteractor()
    }
}
