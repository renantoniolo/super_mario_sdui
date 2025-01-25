//
//  GameConfigurator.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 21/01/25.
//

import UIKit

final class GameConfigurator {
    func configuratorGameView() -> UIViewController {
        let view = GameView()
        let presenter = GamePresenter(view: view)
        let interactor = GameInteractor(presenter: presenter)
        view.presenter = presenter
        presenter.interactor = interactor
        return view
    }
}
