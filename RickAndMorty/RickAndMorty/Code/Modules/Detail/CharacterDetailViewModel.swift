//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Javier Eduardo Rodriguez Ardila on 12/11/23.
//

import Foundation
import Combine

class CharacterDetailViewModel: BaseViewModel {
    
    private var dataManager: CharacterDetailDataManager
    

    //    MARK: - Object lifecycle
    
    init(dataManager: CharacterDetailDataManager) {
        self.dataManager = dataManager
    }

}
