//
//  ViewController.swift
//  playSoundinSwift
//
//  Created by Rohim Developer on 1/9/15.
//  Copyright (c) 2015 Smart HRD. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer?
    
    //Func tell that player has finished playing an audio file
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!,
        successfully flag: Bool) {
            println("Finished playing the song")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func playBtnAciton(sender: AnyObject) {
        
        playSound()
    }
    
    @IBAction func stopPlayBtnAciton(sender: AnyObject) {
        
        stopPlaySound()
    }
    
    func playSound(){
        
        let dispatchQueue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, {[weak self] in
            let mainBundle = NSBundle.mainBundle()
            
            // Find the location
            //let filePath = mainBundle.pathForResource("test", ofType:"mp3")
            let filePath = mainBundle.pathForResource("mysong", ofType:"mp3")
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                var error:NSError?
                
                //Start the audio player
                self!.audioPlayer = AVAudioPlayer(data: fileData, error: &error)
                
                //Check Condtion: 1) try to instance AvAuditoPlay then 2) will it play
                if let player = self!.audioPlayer{
  
                    player.delegate = self
                    if player.prepareToPlay() && player.play(){
 
                    } else {
                        //Failed to play
                    }
                } else {
                    //Failed to instantiate AVAudioPlayer
                }
            }
            
        })
        
    }
    
    //////// Func stop play sound
    
    func stopPlaySound(){
        if let player = audioPlayer{
            player.stop()
        }
    }
}

