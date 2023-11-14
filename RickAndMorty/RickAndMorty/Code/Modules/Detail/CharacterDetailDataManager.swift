//
//  CharacterDetailDataManager.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 12/11/23.
//

import Foundation

class CharacterDetailDataManager {
    
    // MARK: - Properties
    
    private var apiClient: CharacterDetailAPIClient
    
    //    MARK: - Object lifecycle
    
    init(apiClient: CharacterDetailAPIClient) {
        self.apiClient = apiClient
    }
    
}
