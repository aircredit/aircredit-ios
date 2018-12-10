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
import FlowingMenu

class ViewController: UIViewController, FlowingMenuDelegate {
    @IBOutlet var flowingMenuTransitionManager: FlowingMenuTransitionManager!

    let PresentSegueName = "PresentMenuSegue"
    let DismissSegueName = "DismissMenuSegue"
    let CellName         = "UserContactCell"
    let mainColor      = UIColor(hex: 0x804C5F)

    
    private var player: AVPlayer!
    var menu: UIViewController?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PresentSegueName {
            let vc                   = segue.destination
            vc.transitioningDelegate = flowingMenuTransitionManager
            
            flowingMenuTransitionManager.setInteractiveDismissView(vc.view)
            
            menu = vc
        }
    }
    @IBAction func unwindToMainViewController(_ sender: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (flowingMenuTransitionManager != nil){
            flowingMenuTransitionManager.setInteractivePresentationView(view)
            flowingMenuTransitionManager.delegate = self
        }
        
        playBackgroundVideo()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - FlowingMenu Delegate Methods
    
    func colorOfElasticShapeInFlowingMenu(_ flowingMenu: FlowingMenuTransitionManager) -> UIColor? {
        return mainColor
    }
    
    func flowingMenuNeedsPresentMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        performSegue(withIdentifier: PresentSegueName, sender: self)
    }
    
    func flowingMenuNeedsDismissMenu(_ flowingMenu: FlowingMenuTransitionManager) {
        menu?.performSegue(withIdentifier: DismissSegueName, sender: self)
    }

    fileprivate func playBackgroundVideo() {
        //        flowingMenuTransitionManager.delegate = self
        
        // Load the video from the app bundle.
        let videoURL: URL? = Bundle.main.url(forResource: "video", withExtension: "mov")
        if (videoURL != nil){
            player = AVPlayer(url: videoURL!)
            player?.actionAtItemEnd = .none
            player?.isMuted = true
            
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
            playerLayer.zPosition = -1
            playerLayer.frame = view.frame
            view.layer.addSublayer(playerLayer)
            
            player?.play()
            
            //loop video
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()}
        }
    }
}
