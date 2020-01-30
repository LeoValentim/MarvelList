//
//  CharacterDetailsRouter.swift
//  MarvelList
//
//  Created by resource on 29/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import UIKit
import Hero

class CharacterDetailsRouter {
    
    static func createScene(model: CharacterDetailsEntity.ViewModel?) -> CharacterDetailsViewController {
        let view = CharacterDetailsViewController(nibName: CharacterDetailsViewController.typeName, bundle: Bundle.main)
        view.hero.isEnabled = true
        view.model = model
        view.modalPresentationStyle = .overCurrentContext
        return view
    }
    
}
