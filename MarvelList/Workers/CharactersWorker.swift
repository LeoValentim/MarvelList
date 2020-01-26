//
//  CharactersWorker.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

class CharactersWorker {
    
    var store: CharactersStore
    
    init(store: CharactersStore) {
        self.store = store
    }
    
    func fetchCharacters(completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void) {
        store.fetchCharacters(completion: completion)
    }
    
}
