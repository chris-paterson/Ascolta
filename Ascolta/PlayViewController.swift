//
//  PlayViewController.swift
//  Ascolta
//
//  Created by Christopher Paterson on 28/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    let audioManager: AudioManager = AudioManager.sharedInstance
    
    var currentBook: Book?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        audioManager.pause()
        saveBookPosition()
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
    
    private func saveBookPosition() {
        if currentBook != nil {
            currentBook!.savePosition(time: audioManager.currentBookTime())
        }
    }
    
    // Back button from BookTableViewController redirects here
    @IBAction func unwindToPlayer(segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as? BookTableViewController {
            if let passedBook = sourceViewController.selectedBook {
                saveBookPosition()
                currentBook = passedBook
                audioManager.changeFile(book: currentBook!)
            }
        }
    }
}
