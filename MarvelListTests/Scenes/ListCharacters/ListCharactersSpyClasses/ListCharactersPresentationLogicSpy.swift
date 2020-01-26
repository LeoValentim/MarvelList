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

class ListCharactersPresentationLogicSpy: ListCharactersPresentationLogic {
    var didFetchCharacters: Bool = false
    
    func presentCharacters(characters: [Character]?) {
        didFetchCharacters = characters?.isEmpty == false
    }
    
    func didFailure(_ error: Error) {}
}


class ListCharactersBusinessLogicSpy: ListCharactersBusinessLogic
{
    let presenter: ListCharactersPresentationLogic
    
    init(presenter: ListCharactersPresentationLogic) {
        self.presenter = presenter
    }
    
    func fetchCharacters() {
        presenter.presentCharacters(characters: [])
    }
}


class TableViewSpy: UITableView
{
    // MARK: Method call expectations
    
    var reloadDataCalled = false
    
    // MARK: Spied methods
    
    override func reloadData()
    {
        reloadDataCalled = true
    }
}
