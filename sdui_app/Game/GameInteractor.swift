//
//  GameInteractor.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 21/01/25.
//

import Foundation

final class GameInteractor {
    
    private let presenter: GamePresenter
    // #### URL onde se encontra os json da pasta Mock
    private let service: RestApiService = RestApiService(urlString: "https://run.mocky.io/v3/9b9aa8ae-82cc-4765-8e0a-e0444a300aca")//"https://run.mocky.io/v3/464791de-269a-44f1-be61-63e5e274a929")
    
    init(presenter: GamePresenter) {
        self.presenter = presenter
    }
}

extension GameInteractor : GameInteractorInputProtocol {
    func fetchData() {
        service.fetchPost(delegate: self)
    }
}

extension GameInteractor: ApiServiceOutputProtocol {
    func setSuccess(result: ViewStruct) {
        self.presenter.setSuccess(result: result.screen)
    }
    
    func setError(mesage: String) {
        self.presenter.setError(mesage: mesage)
    }
}
