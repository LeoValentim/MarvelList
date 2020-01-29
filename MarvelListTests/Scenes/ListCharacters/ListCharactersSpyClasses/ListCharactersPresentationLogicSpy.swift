//
//  ListCharactersPresentationLogicSpy.swift
//  MarvelListTests
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation
import XCTest
@testable import MarvelList

// MARK: - Output
class ListCharactersOutputSpy: ListCharactersOutput {
    var callDidFecthCharacters: Bool = false
    
    func didFetchCharacters() {
        callDidFecthCharacters = true
    }
    
    func didFailure(_ error: Error) {}
}

// MARK: - Presentation logic
class ListCharactersPresentationLogicSpy: ListCharactersPresentationLogic, ListCharactersDisplayedDataStore {
    var characters: [ListCharactersEntity.ViewModel] = []
    var topCharacters: [ListCharactersEntity.ViewModel] = []
    var didFetchCharacters: Bool = false
    
    weak var view: ListCharactersOutput?
    
    func presentCharacters(characters: [Character]?) {
        didFetchCharacters = characters?.isEmpty == false
    }
    
    func didFailure(_ error: Error) {}
}

// MARK: - Business logic
class ListCharactersBusinessLogicSpy: ListCharactersBusinessLogic, ListCharactersDataStore {
    var characters: [Character]?
    let presenter: ListCharactersPresentationLogic
    
    var didCallFetchCharacters: Bool = false
    
    init(presenter: ListCharactersPresentationLogic) {
        self.presenter = presenter
    }
    
    func fetchCharacters() {
        didCallFetchCharacters = true
        presenter.presentCharacters(characters: characters ?? [])
    }
}

// MARK: - Collection View
class CollectionViewSpy: UICollectionView {
    var reloadDataCalled = false
    
    override func reloadData() {
        reloadDataCalled = true
    }
}
