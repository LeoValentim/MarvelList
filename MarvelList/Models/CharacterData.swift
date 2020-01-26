//
//  CharacterData.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
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
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceUri: String?
    let name: String?
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int?
    let collectionUri: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceUri: String?
    let name: String?
    let type: String?
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: String?
    let url: String?
}

