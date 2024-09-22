//
//  Entity.swift
//  ViperArchitecture
//
//  Created by aman on 19/09/24.
//

import Foundation

struct User: Codable {
    let name: String
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
}

class UserPresenter: AnyPresenter {
     
}
