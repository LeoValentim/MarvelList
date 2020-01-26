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
    
    var viewController: ListCharactersViewController?
    var window: UIWindow?

    override func setUp() {
        window = UIWindow()
        viewController = ListCharactersViewController(nibName: ListCharactersViewController.typeName, bundle: Bundle.main)
    }

    override func tearDown() {
        window = nil
        viewController = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
