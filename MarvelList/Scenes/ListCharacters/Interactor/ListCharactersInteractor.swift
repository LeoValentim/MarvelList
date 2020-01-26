//
//  ListCharactersInteractor.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

// MARK: - Interactor
class ListCharactersInteractor {
    
    let worker: CharactersWorker
    let presenter: ListCharactersPresentationLogic
    
    var characters: [Character]?
    
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
        worker.fetchCharacters { [weak self] result in
            switch result {
                case .success(let response):
                    let characters = response.data?.results
                    self?.characters = characters
                    self?.presenter.presentCharacters(characters: characters)
                case .failure(let error):
                    self?.presenter.didFailure(error)
            }
        }
    }
}
