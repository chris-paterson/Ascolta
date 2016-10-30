//
//  SleepTimer.swift
//  Ascolta
//
//  Created by Christopher Paterson on 30/10/2016.
//  Copyright © 2016 Christopher Paterson. All rights reserved.
//

import Foundation
class SleepTimer {
    
    func beginCountdown(minutesToSleep: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            // Put your code which should be executed with a delay here
        })
    }
}
