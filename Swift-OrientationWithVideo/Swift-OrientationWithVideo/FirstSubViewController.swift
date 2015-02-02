//
//  FirstSubViewController.swift
//  Swift-OrientationWithVideo
//
//  Created by Rohim Developer on 2/2/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit

import MediaPlayer

class FirstSubViewController: UIViewController {
    
    var moviePlayer: MPMoviePlayerController?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //set orientation to potrait only
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Portrait.rawValue)
    }
    
    //tell it to auto rotate
    override func shouldAutorotate() -> Bool{
        return true
    }
    
    
    @IBAction func playAction(sender: AnyObject) {
        
        startPlayingVideo()
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
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


}
