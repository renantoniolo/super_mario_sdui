//
//  GamePresenter.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 21/01/25.
//

import Foundation

final class GamePresenter {
    
    let view: GameView
    var interactor: GameInteractor!
    
    init(view: GameView) {
        self.view = view
        self.interactor = GameInteractor(presenter: self)
    }
    
    func viewDidLoad() {
        self.interactor.fetchData()
    }
    
    private func makeScreen(components: [Component]) {
        components.forEach { component in
            switch(component.type) {
                case "label":
                    if component.id == "label_scorre" {
                        self.view.makeLabelScorre(component: component)
                    } else {
                        if component.name == "NAME" {
                            self.view.makeLabelScorreValueLife(component: component)
                        } else if component.name == "JUMP" {
                            self.view.makeLabelScorreValueJump(component: component)
                        } else if component.name == "WORLD" {
                            self.view.makeLabelScorreValueWorld(component: component)
                        }
                    }
                case "image":
                    if component.id == "character" {
                        self.view.makeCharacterImage(img: component.name ?? "luiggi")
                    } else {
                        self.view.makeBackgroundImage(img: component.name ?? "background_castle")
                    }

                case "background_color":
                    if component.id == "view_gram" {
                        self.view.makeBackgroundColorGram(color: component.value ?? "white")
                    } else {
                        self.view.makeBackgroundColorEart(color: component.value ?? "white")
                    }
                
                default:
                    print("default")
            }
        }
        self.view.setFinish()
    }
}

extension GamePresenter: GamePresenterOutputProtocol {
    func setError(mesage: String) {
        self.view.setError(mesage: mesage, isError: true)
    }
    
    func setSuccess(result: Screen) {
        self.makeScreen(components: result.components)
    }
}
