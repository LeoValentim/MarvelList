//
//  BaseResponse.swift
//  MarvelList
//
//  Created by resource on 25/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHtml: String?
    let data: T?
    let etag: String?
}
