//
//  RestApiService.swift
//  sdui_app
//
//  Created by Renan Toniolo Rocha on 23/01/25.
//
import Foundation
//import UIKit

final class RestApiService {
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func fetchPost(delegate: ApiServiceOutputProtocol) {
        guard let url = URL(string: urlString) else {
            delegate.setError(mesage: "URL inválida!")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                delegate.setError(mesage: "Erro na requisição: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                delegate.setError(mesage: "Código de status inválido: \(httpResponse.statusCode)")
                return
            }
            
            guard let data = data else {
                delegate.setError(mesage: "Dados ausentes!")
                return
            }
            
            do {
                let screenGame = try JSONDecoder().decode(ViewStruct.self, from: data)
                print("### Tela Recebida ###")
                print("Title: \(screenGame.screen.title)")
                DispatchQueue.main.async {
                    delegate.setSuccess(result: screenGame)
                }
            } catch {
                delegate.setError(mesage: "Erro ao decodificar JSON: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
