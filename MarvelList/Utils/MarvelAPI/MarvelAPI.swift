//
//  MarvelAPI.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

struct MarvelAPI {
    
    static let baseURL = "https://gateway.marvel.com/"
    
    struct Key {
        static let publicKey = "b2a81769be16497b03bcaade12b1d579"
        static let privateKey = "8870cd59a5f16d9104d481c90efcb2c6c299b355"
    }
    
    struct Endpoint {
        static var characters: String {
            return generateURL(with: "v1/public/characters")
        }
        
        fileprivate static func generateURL(with endPoint: String) -> String {
            let timestamp = "\(Date().timeIntervalSince1970)"
            let hash = MarvelAPI.generateHash(timestamp: timestamp) ?? ""
            return "\(MarvelAPI.baseURL)\(endPoint)?ts=\(timestamp)&apikey=\(MarvelAPI.Key.publicKey)&hash=\(hash)"
        }
    }
    
    static func generateHash(timestamp: String) -> String? {
        return "\(timestamp)\(Key.privateKey)\(Key.publicKey)".toMD5()
    }
    
}
