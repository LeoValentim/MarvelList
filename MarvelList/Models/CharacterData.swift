//
//  CharacterData.swift
//  MarvelList
//
//  Created by Leo Valentim on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

// MARK: - CharacterData
struct CharacterData: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case results = "results"
    }
}

// MARK: - Result
struct Character: Codable {
    let id: Int?
    let name: String?
    let resultDescription: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceUri: String?
    let comics: Comics?
    let series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case resultDescription = "description"
        case modified = "modified"
        case thumbnail = "thumbnail"
        case resourceUri = "resourceURI"
        case comics = "comics"
        case series = "series"
        case stories = "stories"
        case events = "events"
        case urls = "urls"
    }
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [ComicsItem]?
    let returned: Int?
    
    enum CodingKeys: String, CodingKey {
        case available = "available"
        case collectionUri = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceUri: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceUri = "resourceURI"
        case name = "name"
    }
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [StoriesItem]?
    let returned: Int?
    
    enum CodingKeys: String, CodingKey {
        case available = "available"
        case collectionUri = "collectionURI"
        case items = "items"
        case returned = "returned"
    }
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceUri: String?
    let name: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceUri = "resourceURI"
        case name = "name"
        case type = "type"
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case url = "url"
    }
}
