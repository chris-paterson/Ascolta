//
//  PlayViewController.swift
//  Ascolta
//
//  Created by Christopher Paterson on 28/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    let audioManager: AudioManager = AudioManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let books = DocumentManager.getBookList()
        audioManager.changeFile(book: books[0])
        print(DocumentManager.getNumberOfBooks())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        audioManager.pause()
    }
    
    @IBAction func play(_ sender: AnyObject) {
        audioManager.play()
    }

    @IBAction func pause(_ sender: AnyObject) {
        audioManager.pause()
    }
    
    @IBAction func resetDefaults(_ sender: Any) {
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
}
