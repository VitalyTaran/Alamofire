//
//  NetworkManager.swift
//  AlamofireHW
//
//  Created by Виталий Таран on 15.08.2022.
//

import Foundation
import Alamofire

protocol NetworkDelegate {
    func updateUI(with chars: [Character])
}

class NetworkManager {
    
    var delegate: NetworkDelegate?
    
    func performRequest() {
        AF.request("https://gateway.marvel.com/v1/public/characters?ts=1&apikey=4c7c0f61e37a25cc26778a4e11fdd4e5&hash=a6dab223fd7a5fc6570be234e8172df5")
            .validate()
            .responseDecodable(of: MarvelResponse.self) { (data) in
                guard let response = data.value else { return }
                let characters = response.data.results
                
                DispatchQueue.main.async {
                    self.delegate?.updateUI(with: characters)
                }
            }
    }
}
