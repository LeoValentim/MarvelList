//
//  Sequence+extensions.swift
//  MarvelList
//
//  Created by Leo Valentim on 26/01/20.
//  Copyright © 2020 Leo Valentim. All rights reserved.
//

import Foundation

extension Sequence {
    
    /// Limits sequence indexes to a given maximum number
    ///
    /// - Parameter max: maximum number of indexes
    /// - Returns: return limited sequence
    public func limit(_ max: Int) -> [Element] {
        return self.enumerated()
            .filter { $0.offset < max }
            .map { $0.element }
    }
    
}
