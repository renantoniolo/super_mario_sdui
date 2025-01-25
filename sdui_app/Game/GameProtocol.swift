//
//  GameProtocol.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 21/01/25.
//

import Foundation

protocol GameInteractorInputProtocol : AnyObject {
    func fetchData()
}

protocol GamePresenterOutputProtocol : AnyObject {
    func setError(mesage: String)
    func setSuccess(result: Screen)
}

protocol GameViewOutputProtocol : AnyObject {
    func setError(mesage: String, isError: Bool)
    func setLoading()
    func setFinish()
}

protocol GameViewInputProtocol : AnyObject {
    func makeLabelScorre(component: Component)
    func makeLabelScorreValueLife(component: Component)
    func makeLabelScorreValueWorld(component: Component)
    func makeLabelScorreValueJump(component: Component)
    func makeCharacterImage(img: String)
    func makeBackgroundImage(img: String)
    func makeBackgroundColorEart(color: String)
    func makeBackgroundColorGram(color: String)
}

protocol ApiServiceOutputProtocol : AnyObject {
    func setError(mesage: String)
    func setSuccess(result: ViewStruct)
}
