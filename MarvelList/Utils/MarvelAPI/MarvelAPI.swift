//
//  MarvelAPI.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

/// Class that contains the constants info from MarvelAPI
struct MarvelAPI {
    
    /// MarvelAPI base url
    static let baseURL = "https://gateway.marvel.com/"
    
    /// Keys used for http requrst authentications
    struct Key {
        static let publicKey = "b2a81769be16497b03bcaade12b1d579"
        static let privateKey = "8870cd59a5f16d9104d481c90efcb2c6c299b355"
    }
    
    /// Marvel API endpoints
    struct Endpoint {
        
        /// Characters list endpoint
        static var characters: String {
            return generateURL(with: "v1/public/characters")
        }
        
        /// Generates baseURL with credentials for http resquest
        /// - Parameter endPoint: endpoint that will be concatenates in the URL
        fileprivate static func generateURL(with endPoint: String) -> String {
            let timestamp = "\(Date().timeIntervalSince1970)"
            let hash = MarvelAPI.generateHash(timestamp: timestamp) ?? ""
            return "\(MarvelAPI.baseURL)\(endPoint)?ts=\(timestamp)&apikey=\(MarvelAPI.Key.publicKey)&hash=\(hash)"
        }
        
    }
    
    /// Hash used to authenticate requests in Marvel API
    /// - Parameter timestamp: current timestamp string
    static func generateHash(timestamp: String) -> String? {
        return "\(timestamp)\(Key.privateKey)\(Key.publicKey)".toMD5()
    }
    
}
