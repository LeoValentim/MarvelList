//
//  CharacterDetailsEntity.swift
//  MarvelList
//
//  Created by resource on 29/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

struct CharacterDetailsEntity {
    struct ViewModel {
        let name: String
        let description: String
        let imageURL: String
        let heroId: String?
        
        init(name: String, description: String, imageURL: String, heroId: String?) {
            self.name = name
            self.description = description
            self.imageURL = imageURL
            self.heroId = heroId
        }
        
        init(from model: Character, heroId: String?) {
            name = model.name ?? ""
            description = model.resultDescription ?? ""
            if let path = model.thumbnail?.path, let thumbnailExtension = model.thumbnail?.thumbnailExtension {
                imageURL = "\(path).\(thumbnailExtension)"
            } else {
                imageURL = ""
            }
            self.heroId = heroId
        }
    }
}
