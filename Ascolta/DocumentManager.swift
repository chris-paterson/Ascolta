//
//  DocumentManager.swift
//  Ascolta
//
//  Created by Christopher Paterson on 29/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import Foundation

class DocumentManager {
    
    static func listDocuments() -> URL? {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: [])
            
            for item in directoryContents {
                print(item.absoluteString)
            }
            
            return directoryContents[0]
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
