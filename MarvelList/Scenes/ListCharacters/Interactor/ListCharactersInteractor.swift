//
//  ListCharactersInteractor.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

// MARK: - Data store
protocol ListCharactersDataStore: class {
    var characters: [Character] {get}
}

// MARK: - Interactor
class ListCharactersInteractor: ListCharactersDataStore {
    
    let worker: CharactersWorker
    let presenter: ListCharactersPresentationLogic
    
    var characters: [Character] = []
    var currentPage: Int = 0
    let limitPageCharacters: Int = 20
    
    init(worker: CharactersWorker, presenter: ListCharactersPresentationLogic) {
        self.worker = worker
        self.presenter = presenter
    }
    
}

// MARK: - Business Logic
protocol ListCharactersBusinessLogic: class {
    func fetchCharacters()
}
extension ListCharactersInteractor: ListCharactersBusinessLogic {
    func fetchCharacters() {
        worker.fetchCharacters(limit: limitPageCharacters, offset: limitPageCharacters * currentPage) { [weak self] result in
            switch result {
                case .success(let response):
                    self?.currentPage += 1
                    
                    var characters = self?.characters ?? []
                    let newCharacters = response.data?.results ?? []
                    characters += newCharacters
                    
                    self?.characters = characters
                    self?.presenter.presentCharacters(characters: characters)
                case .failure(let error):
                    self?.presenter.didFailure(error)
            }
        }
    }
}
