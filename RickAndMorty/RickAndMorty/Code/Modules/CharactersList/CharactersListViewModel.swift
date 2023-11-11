//
//  CharactersListViewModel.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import Foundation
import Combine

class CharactersListViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    @Published var characters: [Result]?
    private var dataManager: CharacterListDataManager
    
    // MARK: - Public Methods
    
    init(dataManager: CharacterListDataManager) {
        self.dataManager = dataManager
    }
    
    func getAllCharactersList() {
        dataManager.getCharactersList()
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: { [weak self] charactersList in
                self?.characters = charactersList
            }.store(in: &cancellables)
        
    }
}
