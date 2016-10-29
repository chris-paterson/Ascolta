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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(_ sender: AnyObject) {
        audioManager.play()
    }

    @IBAction func pause(_ sender: AnyObject) {
        audioManager.pause()
    }
}
