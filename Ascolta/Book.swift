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
    let url: URL
    
    private let locationManager: BookLocationManager
    
    var currentTime: Double {
        get {
            return locationManager.locationForBook
        }
        
        set {
            locationManager.locationForBook = newValue
        }
    }
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
        self.locationManager = BookLocationManager(bookName: name)
    }
    
    mutating func savePosition(time: Double) {
        currentTime = time
    }
}
