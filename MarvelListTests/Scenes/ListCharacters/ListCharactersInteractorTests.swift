//
//  ListCharactersInteractorTests.swift
//  MarvelListTests
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import XCTest
@testable import MarvelList

class ListCharactersInteractorTests: XCTestCase {
    
    var interactor: ListCharactersInteractor?

    override func setUp() {
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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

extension ListCharactersInteractorTests {
    class ListCharactersPresentationLogicSpy: ListCharactersPresentationLogic {
        var didFetchCharacters: Bool = false
        
        func presentCharacters(characters: [Character]?) {
            didFetchCharacters = characters?.isEmpty == false
        }
        
        func didFailure(_ error: Error) {}
    }
}
