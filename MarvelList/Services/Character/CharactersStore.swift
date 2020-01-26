//
//  CharactersStore.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

protocol CharactersStore {
    func fetchCharacters(completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void)
}
