//
//  NetworkLayer.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation
import SystemConfiguration

enum NetworkError: Error {
    case badURL
    case noInternetConnection
    case serverError(String?)
}

protocol NetworkLayer {
    typealias NetworkResult<T> = Result<T, Error>
    typealias TryAgainAction = (() -> Void)?
    
    var isConnectedToInternet: Bool {get}
    
    // MARK: - GET
    func get(_ url: URL, headers: [String : String]?, completion: @escaping (NetworkResult<Data>) -> Void)
    func get<T: Codable>(_ url: URL, model: T.Type, headers: [String : String]?, completion: @escaping (NetworkResult<T>) -> Void)
    
    // MARK: - POST
    func post(_ url: URL, params: [String : Any], headers: [String : String]?, completion: @escaping (NetworkResult<Data>) -> Void)
    func post<T: Codable>(_ url: URL, model: T.Type, params: [String : Any], headers: [String : String]?, completion: @escaping (NetworkResult<T>) -> Void)
}

extension NetworkLayer {
    public var isConnectedToInternet: Bool {
        get {
            let reachability = SCNetworkReachabilityCreateWithName(nil, "www.google.com")
            var flags = SCNetworkReachabilityFlags()
            SCNetworkReachabilityGetFlags(reachability!, &flags)
            return flags.contains(.reachable) || flags.contains(.isWWAN)
        }
    }
}
