//
//  Tag.swift
//  XMLParser
//
//  Created by Eugene Mozharovsky on 8/30/15.
//  Copyright © 2015 DotMyWay LCC. All rights reserved.
//

import Foundation

/// A protocol indicating a general tag.
public protocol Tag {
    /// A header for a tag.
    var header: String { get }
    
    /// A name for a tag.
    var name: String? { get }
    
    /// A value for a tag.
    var value: String? { get }
}