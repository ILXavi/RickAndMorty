//
//  CharactersListDataManager.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import UIKit
import Combine

class CharacterListDataManager {
    
    // MARK: - Properties
    
    private var apiClient: CharacterListAPIClient
    
    init(apiClient: CharacterListAPIClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - Public Methods
        
    func getCharactersList() -> AnyPublisher<[Result], Error> {
        apiClient.getCharactersList(endpoint: Endpoints.allCharactersURL)
            .tryMap { $0.results }
            .eraseToAnyPublisher()
    }
    
}


