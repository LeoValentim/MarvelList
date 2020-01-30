//
//  TopListCharacterCell.swift
//  MarvelList
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit

class TopListCharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: CustomImageView!
    @IBOutlet weak var name: UILabel!
    
    var model: ListCharactersEntity.ViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 3
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowRadius = 6
        imageView.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageView.layer.masksToBounds = true
    }
    
    func setModel(_ model: ListCharactersEntity.ViewModel) {
        self.model = model
        name.text = model.name
        if let url = URL(string: model.imageURL) {
            imageView.loadAndCacheImage(from: url)
        }
    }

}
