//
//  ViewController.swift
//  playVideoinSwift
//
//  Created by Rohim Developer on 1/8/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//



import UIKit
import MediaPlayer


class ViewController: UIViewController {
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
        let url = mainBundle.URLForResource("soundmovie", withExtension: "mp4")
        
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
    
}