//
//  AudioManager.swift
//  Ascolta
//
//  Created by Christopher Paterson on 28/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

//import Foundation
import AVFoundation

private let _AudioManagerSharedInstance = AudioManager()
class AudioManager {
    static let sharedInstance = AudioManager()
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    var currentBook: Book?
    
    init() {
        setupSharedInstance()
    }
    
    public func play() {
        if let book = currentBook {
            audioPlayer.currentTime = book.currentTime
            audioPlayer.play()
        }
    }
    
    public func pause() {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            if var book = currentBook {
                book.savePosition(time: currentBookTime())
            }
        }
    }
    
    public func changeFile(book: Book) {
        currentBook = book
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: book.url)
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    private func setupSharedInstance() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func currentBookTime() -> Double {
        return audioPlayer.currentTime
    }
}
