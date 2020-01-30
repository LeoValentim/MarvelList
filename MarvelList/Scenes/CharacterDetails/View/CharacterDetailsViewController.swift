//
//  CharacterDetailsViewController.swift
//  MarvelList
//
//  Created by resource on 28/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit
import Hero

class CharacterDetailsViewController: UIViewController {

    @IBOutlet weak var backgroundBlur: UIVisualEffectView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: CustomImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var model: CharacterDetailsEntity.ViewModel?

}

// MARK: - ViewController methods
extension CharacterDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) {
            self.backgroundBlur.alpha = 1
        }
    }
}

// MARK: - Setup views methods
extension CharacterDetailsViewController {
    func setupViews() {
        backgroundBlur.alpha = 0
        
        cardView.layer.cornerRadius = 10
        cardView.layer.masksToBounds = true
        
        imageView.hero.id = model?.heroId
        titleLabel.text = model?.name
        descriptionLabel.text = model?.description
        if let imageURL = model?.imageURL,
            let url = URL(string: imageURL) {
            imageView.loadAndCacheImage(from: url)
        }
    }
}

// MARK: - Actions
extension CharacterDetailsViewController {
    @IBAction func closeView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
