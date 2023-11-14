//
//  CharactersListAPIClient.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import Foundation
import Combine

class CharacterListAPIClient: BaseAPIClient {
    
    //    MARK: - Public Methods
    
    func getCharactersList(endpoint: String) -> Future<Characters, Error> {
        makeRequest(endpoint: endpoint, type: Characters.self)
    }
}
