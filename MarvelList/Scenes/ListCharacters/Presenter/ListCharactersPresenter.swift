//
//  ListCharactersPresenter.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

// MARK: - Presenter
class ListCharactersPresenter {
    weak var view: ListCharactersOutput?
}

// MARK: - Presentation Logic
protocol ListCharactersPresentationLogic: class {
    func presentCharacters(characters: [Character]?)
    func didFailure(_ error: Error)
}
extension ListCharactersPresenter: ListCharactersPresentationLogic {
    func presentCharacters(characters: [Character]?) {
        view?.didFetchCharacters()
    }
    
    func didFailure(_ error: Error) {
        view?.didFailure(error)
    }
}
