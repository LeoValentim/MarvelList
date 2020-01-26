//
//  TopListCharactersViewCell.swift
//  MarvelList
//
//  Created by resource on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit

class TopListCharactersViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private weak var dataStore: ListCharactersDataStore?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

}

// MARK: - Setup views methods
extension TopListCharactersViewCell {
    func setupViews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: TopListCharacterCell.typeName, bundle: Bundle.main),
                                forCellWithReuseIdentifier: TopListCharacterCell.typeName)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 175, height: 275)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.reloadData()
    }
    
    func setDataStore(dataStore: ListCharactersDataStore?) {
        self.dataStore = dataStore
        collectionView.reloadData()
    }
}

// MARK: - CollectionView delegate & datasource
extension TopListCharactersViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataStore?.topCharacters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopListCharacterCell.typeName, for: indexPath) as? TopListCharacterCell,
            let model = dataStore?.topCharacters[indexPath.row]
            else {return UICollectionViewCell()}
        cell.setModel(model)
        return cell
    }
}
