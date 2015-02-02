//
//  ViewController.swift
//  DemoApp
//
//  Created by Rohim Developer on 1/12/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit
import MediaPlayer

class PlayVideoViewController: UIViewController {

    var moviePlayer: MPMoviePlayerController?
    
    
    func stopPlayingVideo() {
        if let player = moviePlayer{
            
            NSNotificationCenter.defaultCenter().removeObserver(self)
            player.stop()
            player.view.removeFromSuperview()
            
        }
        
        
    }        
    
    func startPlayingVideo(){
        
        let mainBundle = NSBundle.mainBundle()
        let url = mainBundle.URLForResource("video", withExtension: "mp4")
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
       
        
        if let player = moviePlayer{
            
            NSNotificationCenter.defaultCenter().addObserver(self,
                selector: "stopPlayingVideo",
                name: MPMoviePlayerPlaybackDidFinishNotification,
                object: nil)
            
            player.scalingMode = .AspectFit
            view.addSubview(player.view)
            player.setFullscreen(true, animated: false)

            //start play
            player.play()
        } else {
            println("Failed to instantiate the movie player")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func playBtn(sender: AnyObject) {
        
        
        
        startPlayingVideo()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    override func shouldAutorotate() -> Bool{
        return true
    }
    


}

