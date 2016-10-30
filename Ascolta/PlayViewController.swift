//
//  PlayViewController.swift
//  Ascolta
//
//  Created by Christopher Paterson on 28/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    enum State {
        case playing
        case paused
    }
    
    let audioManager: AudioManager = AudioManager.sharedInstance
    let playIcon = #imageLiteral(resourceName: "play")
    let pauseIcon = #imageLiteral(resourceName: "pause")
    
    var currentBook: Book?
    var state: State = .paused
    
    @IBOutlet weak var controllImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controllImageView.image = playIcon
        let toggleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PlayViewController.togglePlayPause))
        
        
        
        controllImageView.isUserInteractionEnabled = true
        controllImageView.addGestureRecognizer(toggleTapGestureRecognizer)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveBookPosition()
    }
    
    func togglePlayPause() {
        if state == .paused {
            play()
        } else if state == .playing {
            pause()
        }
    }
    
    func play() {
        audioManager.play()
        controllImageView.image = pauseIcon
        state = .playing
    }
    
    func pause() {
        audioManager.pause()
        saveBookPosition()
        controllImageView.image = playIcon
        state = .paused
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
