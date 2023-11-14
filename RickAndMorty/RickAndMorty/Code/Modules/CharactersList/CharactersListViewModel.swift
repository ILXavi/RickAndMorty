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
    
    private let state: CurrentValueSubject<DataState, Never> = .init(.loading)
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
                    self.state.send(.error(error))
                }
            } receiveValue: { [weak self] charactersList in
                self?.state.send(.success(charactersList))
            }.store(in: &cancellables)
        
    }
    
    func goToCharacterDetail (character: Result) {
        characterDetailWireframe.present(character: character)
    }
    
    func getState() -> AnyPublisher<DataState, Never> {
        return state.eraseToAnyPublisher()
    }
    
    // MARK: - States
    
    enum DataState {
        case loading
        case success([Result])
        case error(Error)
    }
}
