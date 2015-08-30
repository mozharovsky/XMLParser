//
//  XMLTag.swift
//  XMLParser
//
//  Created by Eugene Mozharovsky on 8/30/15.
//  Copyright © 2015 DotMyWay LCC. All rights reserved.
//

import Foundation

/// An XML rich tag, e.g. `<td class='num'>`.
struct XMLTag: Tag, Hashable, Equatable, StringLiteralConvertible {
    /// A header for a tag. Used to indicate start/end of the cell.
    /// (`<td class='num'>` -> 'td')
    let header: String
    
    /// A name of the tag.
    /// (`<td class='num'>` -> 'class')
    let name: String?
    
    /// A value for a tag.
    /// (`<td class='num'>` -> 'num')
    let value: String?
    
    // MARK: - Hashable
    
    /// Hash value.
    var hashValue: Int {
        return header.hashValue | (name?.hashValue.hashValue ?? 0) | (value?.hashValue ?? 0)
    }
    
    // MARK: - StringLiteralConvertible
    
    /// An initializer from String. 
    /// e.g. `let tag: XMLTag = "myTag"`
    init(stringLiteral value: String) {
        self.header = value
        self.name = nil
        self.value = nil
    }
    
    init(unicodeScalarLiteral value: String){
        self.header = value
        self.name = nil
        self.value = nil
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        self.header = value
        self.name = nil
        self.value = nil
    }
    // MARK: - General initializer
    
    /// A general initializer. Header is required, when name and value 
    /// are optional parameters.
    init(header: String, name: String? = nil, value: String? = nil) {
        self.header = header
        self.name = name
        self.value = value
    }
}

/// Indicates if two XMLTag are equal or not.
func ==(lhs: XMLTag, rhs: XMLTag) -> Bool {
    return lhs.hashValue == rhs.hashValue
}