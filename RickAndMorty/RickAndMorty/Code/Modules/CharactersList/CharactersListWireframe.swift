//
//  CharactersListWireframe.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 9/11/23.
//

import Foundation

class CharactersListWireframe: BaseWireframe {
    
    // MARK: - Properties
    
    private var viewController: CharactersListViewController {
        
        // Generating module components
        let viewController: CharactersListViewController = CharactersListViewController(nibName: "CharactersListView", bundle: nil)
        let dataManager: CharacterListDataManager = createDataManager(apiClient: apiClient)
        let viewModel: CharactersListViewModel = createViewModel(with: dataManager, characterDetailWireframe: characterDetailWireframe)
        viewController.set(viewModel: viewModel)
        return viewController
    }
    
    private var apiClient: CharacterListAPIClient {
        return CharacterListAPIClient()
    }
    
    private var characterDetailWireframe: CharacterDetailWireframe {
        return CharacterDetailWireframe()
    }
    
    // MARK: - Private methods
    
    private func createViewModel(with dataManager: CharacterListDataManager, characterDetailWireframe: CharacterDetailWireframe) -> CharactersListViewModel {
        return CharactersListViewModel(dataManager: dataManager, characterDetailWireframe: characterDetailWireframe)
    }
    
    private func createDataManager(apiClient: CharacterListAPIClient) -> CharacterListDataManager {
        return CharacterListDataManager(apiClient: apiClient)
    }
    
    // MARK: - Public methods
    
    func present() {
        super.present(viewController: viewController)
    }
    

}
