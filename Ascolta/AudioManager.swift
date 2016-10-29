//
//  AudioManager.swift
//  Ascolta
//
//  Created by Christopher Paterson on 28/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

//import Foundation
import AVFoundation

class AudioManager {
    
    var audioPlayer = AVAudioPlayer()
    
    init() {
        setupSharedInstance()
    }
    
    public func play() {
        audioPlayer.play()
    }
    
    public func pause() {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }
    
    public func changeFile(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
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
}
