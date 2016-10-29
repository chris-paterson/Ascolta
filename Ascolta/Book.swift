//
//  Book.swift
//  Ascolta
//
//  Created by Christopher Paterson on 29/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import Foundation

struct Book {
    let name: String
    let path: URL
    var position: Int
    
    init(name: String, path: URL) {
        self.name = name
        self.path = path
        self.position = 4
    }
}
