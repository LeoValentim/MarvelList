//
//  ListCharactersRouter.swift
//  MarvelList
//
//  Created by resource on 29/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit

// MARK: - Router
class ListCharactersRouter {
    weak var view: ListCharactersViewController?
    weak var dataStore: ListCharactersDataStore?
    
    init(view: ListCharactersViewController?, dataStore: ListCharactersDataStore?) {
        self.view = view
        self.dataStore = dataStore
    }
    
    static func createScene() -> ListCharactersViewController {
        let view = ListCharactersViewController(nibName: ListCharactersViewController.typeName, bundle: Bundle.main)
        
        let networkLayer = NetworkURLSession()
        let store = CharactersStoreRemote(networkLayer: networkLayer)
        let worker = CharactersWorker(store: store)
        let presenter = ListCharactersPresenter(view: view)
        let interactor = ListCharactersInteractor(worker: worker, presenter: presenter)
        let router = ListCharactersRouter(view: view, dataStore: interactor)
        
        view.interactor = interactor
        view.dataStore = presenter
        view.routeNavigation = router
        
        return view
    }
    
}

// MARK: - Navigation
protocol ListCharactersNavigation: class {
    func goToDetails(characterAt index: Int, heroId: String?)
}
extension ListCharactersRouter: ListCharactersNavigation {
    func goToDetails(characterAt index: Int, heroId: String?) {
        guard let character = dataStore?.characters[index] else {return}
        let model = CharacterDetailsEntity.ViewModel(from: character, heroId: heroId)
        let detailsView = CharacterDetailsRouter.createScene(model: model)
        view?.present(detailsView, animated: true, completion: nil)
    }
}
