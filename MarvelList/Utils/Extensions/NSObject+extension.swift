//
//  NSObject+extension.swift
//  MarvelList
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

extension NSObject {
    
    /// Returns the class name of current object as String
    static var typeName: String {
        return String(describing: self)
    }
    
}
