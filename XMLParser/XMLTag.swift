//
//  XMLTag.swift
//  XMLParser
//
//  Created by Eugene Mozharovsky on 8/30/15.
//  Copyright © 2015 DotMyWay LCC. All rights reserved.
//

import Foundation

/// An XML rich tag, e.g. `<td class='num'>`.
public class XMLTag: NSObject, Tag, StringLiteralConvertible {
    /// A header for a tag. Used to indicate start/end of the cell.
    /// (`<td class='num'>` -> 'td')
    public let header: String
    
    /// A name of the tag.
    /// (`<td class='num'>` -> 'class')
    public let name: String?
    
    /// A value for a tag.
    /// (`<td class='num'>` -> 'num')
    public let value: String?
    
    // MARK: - StringLiteralConvertible
    
    /// An initializer from String. 
    /// e.g. `let tag: XMLTag = "myTag"`
    public required init(stringLiteral value: String) {
        self.header = value
        self.name = nil
        self.value = nil
    }
    
    public required init(unicodeScalarLiteral value: String){
        self.header = value
        self.name = nil
        self.value = nil
    }
    
    required public init(extendedGraphemeClusterLiteral value: String) {
        self.header = value
        self.name = nil
        self.value = nil
    }
    
    // MARK: - General initializer
    
    /// A general initializer. Header is required, when name and value 
    /// are optional parameters.
    public init(header: String, name: String? = nil, value: String? = nil) {
        self.header = header
        self.name = name
        self.value = value
    }
    
    /// A failable initializer. Tries to automatically 
    /// cast a given type to *String*, if can't be done
    /// returns nil.
    public init?(anyValue: Any) {
        if let string = anyValue as? NSString {
            self.header = String(string)
            self.name = nil
            self.value = nil
            super.init()
        } else {
            self.header = ""
            self.name = nil
            self.value = nil
            super.init()
            
            return nil
        }
    }
}

// MARK: - NSCopying

extension XMLTag: NSCopying {
    @objc public func copyWithZone(zone: NSZone) -> AnyObject {
        return XMLTag(header: header, name: name, value: value)
    }
}