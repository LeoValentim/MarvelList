//
//  NetworkURLSession.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

class NetworkURLSession: NetworkLayer {
    func generateRequest(url: URL) -> URLRequest {
        let resquest = URLRequest(url: url)
        return resquest
    }
    
    func get(_ url: URL, headers: [String : String]?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard isConnectedToInternet else {
            let error = NetworkError.noInternetConnection
            completion(.failure(error))
            return
        }
        
        var request = generateRequest(url: url)
        request.httpMethod = "GET"
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.serverError(nil)))
                    return
                }
                
                completion(.success(data))
            }
        }).resume()
    }
    
    func get<T: Codable>(_ url: URL, model: T.Type, headers: [String : String]?, completion: @escaping (Result<T, Error>) -> Void) {
        get(url, headers: headers) { result in
            switch result {
                case .success(let data):
                    do {
                        let resultObjc = try JSONDecoder().decode(model, from: data)
                        completion(.success(resultObjc))
                    } catch {
                        completion(.failure(error))
                }
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
    
    func post(_ url: URL, params: [String : Any], headers: [String : String]?, completion: @escaping (Result<Data, Error>) -> Void) {
        guard isConnectedToInternet else {
            let error = NetworkError.noInternetConnection
            completion(.failure(error))
            return
        }
        
        var request = generateRequest(url: url)
        request.httpMethod = "POST"
        headers?.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        request.httpBody = NSKeyedArchiver.archivedData(withRootObject: params)
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkError.serverError(nil)))
                    return
                }
                
                completion(.success(data))
            }
        }).resume()
    }
    
    func post<T: Codable>(_ url: URL, model: T.Type, params: [String : Any], headers: [String : String]?, completion: @escaping (Result<T, Error>) -> Void) {
        post(url, params: params, headers: headers) { result in
            switch result {
                case .success(let data):
                    do {
                        let resultObjc = try JSONDecoder().decode(model, from: data)
                        completion(.success(resultObjc))
                    } catch {
                        completion(.failure(error))
                }
                case .failure(let err):
                    completion(.failure(err))
            }
        }
    }
}
