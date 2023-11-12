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
    private var characterDetailWireframe: CharacterDetailWireframe
    
    // MARK: - Object lifecycle
    
    init(dataManager: CharacterListDataManager, characterDetailWireframe: CharacterDetailWireframe) {
        self.dataManager = dataManager
        self.characterDetailWireframe = characterDetailWireframe
    }
    
    // MARK: - Public Methods
    
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
    
    func goToCharacterDetail (character: Result) {
        characterDetailWireframe.present(character: character)
    }
}
