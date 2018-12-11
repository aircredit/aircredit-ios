//
//  ViewController.swift
//  aircredit
//
//  Created by Michel Courtine on 12/6/18.
//  Copyright © 2018 Michel Courtine. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import SwiftCharts

class ViewController: UIViewController {

    private var player: AVPlayer!
    @IBOutlet weak var VideoStillBackground: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Load the video from the app bundle.
        let videoURL: URL? = Bundle.main.url(forResource: "video", withExtension: "mov")
        if (videoURL != nil){
            player = AVPlayer(url: videoURL!)
            player?.actionAtItemEnd = .none
            player?.isMuted = true
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            VideoStillBackground.layer.addSublayer(playerLayer)
            playerLayer.frame = view.frame
            player?.play()
            //loop video
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()}
        }
    }
}
