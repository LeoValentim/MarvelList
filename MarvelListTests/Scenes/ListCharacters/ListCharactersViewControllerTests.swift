//
//  ListCharactersViewControllerTests.swift
//  MarvelListTests
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import XCTest
@testable import MarvelList

class ListCharactersViewControllerTests: XCTestCase {
    
    var viewController: ListCharactersViewController!
    var window: UIWindow!

    override func setUp() {
        window = UIWindow()
        viewController = ListCharactersRouter.createScene()
    }

    override func tearDown() {
        window = nil
        viewController = nil
    }
    
    func loadView() {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func generateCharactersList(limit: Int) -> [Character] {
        var characters: [Character] = []
        for _ in 0..<limit {
            characters.append(Character(id: nil, name: nil, resultDescription: nil, modified: nil, thumbnail: nil, resourceUri: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil))
        }
        return characters
    }
    
    func testCallFetchCharacters() {
        let presentationLogic = ListCharactersPresentationLogicSpy()
        let businessLogic = ListCharactersBusinessLogicSpy(presenter: presentationLogic)
        viewController.interactor = businessLogic
        
        loadView()
        viewController.viewDidLoad()
        XCTAssert(businessLogic.didCallFetchCharacters)
    }
    
    func testReloadDataWhenFetchCharacters() {
        loadView()
        
        let collectionView = CollectionViewSpy(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        viewController.collectionView = collectionView
        let presentationLogic = ListCharactersPresenter(view: viewController)
        presentationLogic.view = viewController
        
        presentationLogic.presentCharacters(characters: generateCharactersList(limit: 1))
        
        XCTAssert(collectionView.reloadDataCalled)
    }
    
    func testNumberOfSectionsInCollectionViewShouldAlwaysBeTwo() {
        loadView()
        let collectionView = viewController.collectionView!
        let numberOfSections = viewController.numberOfSections(in: collectionView)
        XCTAssertEqual(numberOfSections, 2, "The number of collection view sections should always be 2")
    }
    
    
    func testShouldConfigureTableViewCellToDisplayOrder()
    {
        loadView()
        
        var characters = generateCharactersList(limit: 5)
        characters.append(Character(id: 0, name: "Joao", resultDescription: "description", modified: nil, thumbnail: nil, resourceUri: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil))

        let presentationLogic = ListCharactersPresenter(view: viewController)
        viewController.dataStore = presentationLogic
        presentationLogic.presentCharacters(characters: characters)
        
        let collectionView = viewController.collectionView!
        let cell = viewController.collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 1)) as! TopListCharacterCell
        
        XCTAssertEqual(cell.name.text, "Joao")
    }

}
