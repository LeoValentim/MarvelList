//
//  CharacterDetailsViewControllerTests.swift
//  MarvelListTests
//
//  Created by resource on 29/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import XCTest
@testable import MarvelList

class CharacterDetailsViewControllerTests: XCTestCase {
    
    var viewController: CharacterDetailsViewController!
    var window: UIWindow!

    override func setUp() {
        window = UIWindow()
        let viewModel = CharacterDetailsEntity.ViewModel(name: "Joao", description: "descricao", imageURL: "jotapegui", heroId: "hiroaidi")
        viewController = CharacterDetailsRouter.createScene(model: viewModel)
    }

    override func tearDown() {
        window = nil
        viewController = nil
    }

    func testExample() {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
        
        XCTAssertEqual(viewController.titleLabel.text, "Joao")
        XCTAssertEqual(viewController.descriptionLabel.text, "descricao")
    }

}
