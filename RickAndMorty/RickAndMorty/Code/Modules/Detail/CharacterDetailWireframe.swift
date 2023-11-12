//
//  CharacterDetailWireframe.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 12/11/23.
//

import Foundation

class CharacterDetailWireframe: BaseWireframe {
    
    // MARK: - Properties
    
    private var character: Result?
    private var viewController: CharacterDetailViewController {
        
        // Generating module components
        let viewController: CharacterDetailViewController = CharacterDetailViewController(nibName: "CharacterDetail", bundle: nil)
        let dataManager: CharacterDetailDataManager = createDataManager(apiClient: apiClient)
        let viewModel: CharacterDetailViewModel = createViewModel(with: dataManager)
        viewController.set(viewModel: viewModel)
        viewController.character = character
        return viewController
    }
    
    private var apiClient: CharacterDetailAPIClient {
        return CharacterDetailAPIClient()
    }
    
    // MARK: - Private methods
    
    private func createViewModel(with dataManager: CharacterDetailDataManager) -> CharacterDetailViewModel {
        return CharacterDetailViewModel(dataManager: dataManager)
    }
    
    private func createDataManager(apiClient: CharacterDetailAPIClient) -> CharacterDetailDataManager {
        return CharacterDetailDataManager(apiClient: apiClient)
    }
    
    // MARK: - Public methods
    
    func present() {
        super.present(viewController: viewController)
    }
    
    func present(character: Result) {
        self.character = character
        super.push(viewController: viewController)
    }
}
