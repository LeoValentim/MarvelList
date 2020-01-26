//
//  ListCharactersEntity.swift
//  MarvelList
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

struct ListCharactersEntity {
    struct ViewModel {
        let name: String
        let imageURL: String
        
        init(name: String, imageURL: String) {
            self.name = name
            self.imageURL = imageURL
        }
        
        init(from model: Character) {
            name = model.name ?? ""
            if let path = model.thumbnail?.path, let thumbnailExtension = model.thumbnail?.thumbnailExtension {
                imageURL = "\(path).\(thumbnailExtension)"
            } else {
                imageURL = ""
            }
        }
    }
}
