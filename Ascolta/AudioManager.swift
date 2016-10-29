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
    var url: URL
    
    init() {
        let path = Bundle.main.path(forResource: "enV - Electronic Super Joy OST - 01 Destination", ofType:"mp3")!
        url = URL(fileURLWithPath: path)
        
        setupPlayer()
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
    
    private func setupPlayer() {
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
