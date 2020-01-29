//
//  ListCharactersPresenterTests.swift
//  MarvelListTests
//
//  Created by Leo Valentim on 29/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import XCTest
@testable import MarvelList

class ListCharactersPresenterTests: XCTestCase {
    
    var presenter: ListCharactersPresenter!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func generateCharactersList(limit: Int) -> [Character] {
        var characters: [Character] = []
        for _ in 0..<limit {
            characters.append(Character(id: nil, name: nil, resultDescription: nil, modified: nil, thumbnail: nil, resourceUri: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil))
        }
        return characters
    }
    
    func testFetchCharacters() {
        let output = ListCharactersOutputSpy()
        let presenter = ListCharactersPresenter(view: output)
        presenter.presentCharacters(characters: generateCharactersList(limit: 1))
        XCTAssert(output.callDidFecthCharacters)
    }
    
    func testNumberOfElementsInFirstSessionShouldAlwaysBeEqualOrLessThanFive() {
        let presenter = ListCharactersPresenter(view: ListCharactersOutputSpy())
        presenter.presentCharacters(characters: generateCharactersList(limit: 6))
        XCTAssertLessThanOrEqual(presenter.topCharacters.count, 5, "The number of itens in first section should always be equal or less than 5")
    }

}
