//
//  CharactersStoreRemote.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

/// Class that uses the network to fetch characters from remote storage.
class CharactersStoreRemote: CharactersStore {
    
    var networkLayer: NetworkLayer
    
    init(networkLayer: NetworkLayer) {
        self.networkLayer = networkLayer
    }
    
    func fetchCharacters(limit: Int, offset: Int, completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void) {
        guard let url = URL(string: MarvelAPI.Endpoint.characters + "&limit=\(limit)&offset=\(offset)") else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        networkLayer.get(url, model: BaseResponse<CharacterData>.self, headers: nil, completion: completion)
    }
}
