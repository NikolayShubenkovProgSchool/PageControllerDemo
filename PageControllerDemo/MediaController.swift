//
//  MediaController.swift
//  PageControllerDemo
//
//  Created by Nikolay Shubenkov on 31/08/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MediaController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.player = AVPlayer(URL: NSURL(string:"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)
        self.showsPlaybackControls = true
    }
        
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.player?.play()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.player?.pause()
    }
}
