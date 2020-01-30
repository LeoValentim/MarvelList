//
//  CharactersWorker.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

class CharactersWorker {
    
    var store: CharactersStore
    
    init(store: CharactersStore) {
        self.store = store
    }
    
    func fetchCharacters(limit: Int, offset: Int, completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void) {
        store.fetchCharacters(limit: limit, offset: offset, completion: completion)
    }
    
}
