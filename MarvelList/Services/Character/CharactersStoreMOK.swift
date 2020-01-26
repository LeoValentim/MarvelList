//
//  CharactersStoreMOK.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

class CharactersStoreMOK: CharactersStore {
    
    private let charactersLocal = ("charactersLocal", "json")
    
    func fetchCharacters(completion: @escaping (Result<BaseResponse<CharacterData>, Error>) -> Void) {
        guard let jsonData = loadLocalCharactersJson() else {
            let error = NSError(domain: "Error", code: 0, userInfo: nil)
            completion(.failure(error))
            return
        }
        
        do {
            let decodedModel = try JSONDecoder().decode(BaseResponse<CharacterData>.self, from: jsonData)
            completion(.success(decodedModel))
        } catch {
            print("error: \(error)")
            completion(.failure(error))
        }
    }
    
    func loadLocalCharactersJson() -> Data? {
        guard let path = Bundle.main.path(forResource: charactersLocal.0, ofType: charactersLocal.1),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return nil
        }
        return data
    }
    
}
