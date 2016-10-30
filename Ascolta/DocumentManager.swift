//
//  DocumentManager.swift
//  Ascolta
//
//  Created by Christopher Paterson on 29/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import Foundation

class DocumentManager {
    
    static func getBookList() -> [Book] {
        var books = [Book]()
        if let directoryContents = getDocuments() {
            for url in directoryContents {
                let bookName = url.lastPathComponent
                books.append(Book(name: bookName, url: url))
            }
        }
        
        return books
    }
    
    static func getNumberOfBooks() -> Int {
        if let directoryContents = getDocuments() {
            return directoryContents.count
        }
        
        return 0
    }
    
    private static func getDocuments() -> [URL]? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: [])
            
           return directoryContents
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
