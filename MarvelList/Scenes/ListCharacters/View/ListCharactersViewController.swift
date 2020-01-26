//
//  ListCharactersViewController.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class ListCharactersViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var refreshControll: UIRefreshControl = {
        let refreshControll = UIRefreshControl()
        refreshControll.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
        return refreshControll
    }()
    
    var interactor: ListCharactersBusinessLogic?
    weak var dataStore: ListCharactersDataStore?

}

// MARK: - ViewController methods
extension ListCharactersViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogic()
        setupViews()
    }
}

// MARK: - Setup views
extension ListCharactersViewController {
    func setupLogic() {
        let networkLayer = NetworkURLSession()
        let store = CharactersStoreRemote(networkLayer: networkLayer)
        let worker = CharactersWorker(store: store)
        let presenter = ListCharactersPresenter(view: self)
        interactor = ListCharactersInteractor(worker: worker, presenter: presenter)
        dataStore = presenter
        
        interactor?.fetchCharacters()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: TopListCharactersViewCell.typeName,
                                      bundle: Bundle.main), forCellWithReuseIdentifier: TopListCharactersViewCell.typeName)
        collectionView.register(UINib(nibName: TopListCharacterCell.typeName,
                                      bundle: Bundle.main), forCellWithReuseIdentifier: TopListCharacterCell.typeName)
        collectionView.refreshControl = refreshControll
        collectionView.addInfiniteScroll { _ in
            self.interactor?.fetchCharacters()
        }
    }
}

// MARK: - Actions
extension ListCharactersViewController {
    @objc func refreshControlAction() {
        interactor?.fetchCharacters()
    }
}

// MARK: - CollectionView delegate & datasource
extension ListCharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return dataStore?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopListCharactersViewCell.typeName, for: indexPath) as? TopListCharactersViewCell else {return UICollectionViewCell()}
                cell.setDataStore(dataStore: dataStore)
                return cell
            
            case 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopListCharacterCell.typeName, for: indexPath) as? TopListCharacterCell,
                    let model = dataStore?.characters[indexPath.row]
                    else {return UICollectionViewCell()}
                cell.setModel(model)
                return cell
            
            default: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
            case 0: return CGSize(width: collectionView.frame.width,
                                  height: 257)
            default:
                let width = UIScreen.main.bounds.width / 3
                return CGSize(width: width,
                                   height: width / 0.68)
        }
    }
}

// MARK: - Output
protocol ListCharactersOutput: class {
    func didFetchCharacters()
    func didFailure(_ error: Error)
}
extension ListCharactersViewController: ListCharactersOutput {
    func didFetchCharacters() {
        collectionView.refreshControl?.endRefreshing()
        collectionView.finishInfiniteScroll()
        collectionView.reloadData()
    }
    
    func didFailure(_ error: Error) {
        collectionView.refreshControl?.endRefreshing()
        collectionView.finishInfiniteScroll()
    }
}
