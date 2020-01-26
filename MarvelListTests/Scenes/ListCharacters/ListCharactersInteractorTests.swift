//
//  ListCharactersInteractorTests.swift
//  MarvelListTests
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import XCTest
@testable import MarvelList

class ListCharactersInteractorTests: XCTestCase {
    
    var interactor: ListCharactersInteractor?

    override func setUp() {
    }

    override func tearDown() {
        interactor = nil
    }

    func testFetchCharacters() {
        let store = CharactersStoreMOK()
        let worker = CharactersWorker(store: store)
        let presenter = ListCharactersPresentationLogicSpy()
        interactor = ListCharactersInteractor(worker: worker, presenter: presenter)
        
        interactor?.fetchCharacters()
        XCTAssertNotNil(interactor?.characters)
        XCTAssert(presenter.didFetchCharacters)
    }

}
