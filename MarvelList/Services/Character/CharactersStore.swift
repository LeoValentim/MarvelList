//
//  CharactersStore.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

protocol CharactersStore {
    func fetchCharacters(limit: Int, offset: Int, completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void)
}
