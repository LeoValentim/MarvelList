//
//  ListCharactersViewController.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit

class ListCharactersViewController: UIViewController {
        
    var interactor: ListCharactersBusinessLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkLayer = NetworkURLSession()
        let store = CharactersStoreRemote(networkLayer: networkLayer)
        let worker = CharactersWorker(store: store)
        let presenter = ListCharactersPresenter()
        interactor = ListCharactersInteractor(worker: worker, presenter: presenter)
        
        interactor?.fetchCharacters()
    }

}

// MARK: - Output
protocol ListCharactersOutput: class {
    func didFetchCharacters()
    func didFailure(_ error: Error)
}
extension ListCharactersViewController: ListCharactersOutput {
    func didFetchCharacters() {
        
    }
    
    func didFailure(_ error: Error) {
        
    }
}
