//
//  ListCharactersPresenter.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation


// MARK: - Presenter
class ListCharactersPresenter: ListCharactersDisplayedDataStore {
    weak var view: ListCharactersOutput?
    
    var characters: [ListCharactersEntity.ViewModel] = []
    var topCharacters: [ListCharactersEntity.ViewModel] = []
    
    init(view: ListCharactersOutput) {
        self.view = view
    }
}

// MARK: - Displayed data store
protocol ListCharactersDisplayedDataStore: class {
    var characters: [ListCharactersEntity.ViewModel] {get}
    var topCharacters: [ListCharactersEntity.ViewModel] {get}
}
// MARK: - Presentation Logic
protocol ListCharactersPresentationLogic: class {
    func presentCharacters(characters: [Character])
    func didFailure(_ error: Error)
}
extension ListCharactersPresenter: ListCharactersPresentationLogic {
    func presentCharacters(characters: [Character]) {
        let viewModels = characters.compactMap { ListCharactersEntity.ViewModel(from: $0) }
        let limitTopArray = 5
        
        if viewModels.count > limitTopArray {
            topCharacters = viewModels.limit(limitTopArray)
            self.characters = Array(viewModels[limitTopArray..<viewModels.count])
        } else {
            topCharacters = viewModels
        }
        
        view?.didFetchCharacters()
    }
    
    func didFailure(_ error: Error) {
        view?.didFailure(error)
    }
}
