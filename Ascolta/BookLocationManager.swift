//
//  BookLocationManager.swift
//  Ascolta
//
//  Created by Christopher Paterson on 29/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import Foundation

class BookLocationManager {
    let bookName: String
    let defaults = UserDefaults.standard
    
    var locationForBook: Double {
        get {
            let location = defaults.double(forKey: bookName)
            return location
        }
        
        set {
            defaults.setValue(newValue, forKey: bookName)
            defaults.synchronize()
        }
    }
    
    init(bookName: String) {
        self.bookName = bookName
    }
}
