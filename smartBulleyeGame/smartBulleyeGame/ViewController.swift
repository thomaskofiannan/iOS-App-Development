//
//  ViewController.swift
//  smartBulleyeGame
//
//  Created by Rohim Developer on 12/18/14.
//  Copyright (c) 2014 smart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //declare slider outlet
    
    @IBOutlet weak var slider : UISlider!
    
    //declare target label
    @IBOutlet weak var targetLabel : UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel : UILabel!
   
    //store the value that user choose
    var currentValue : Int = 50
    //variable store the random or target value
    var targetValue : Int = 0
    
    //variable store the score
    var score = 0
    
    //varibale store round
    var round = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // currentValue = lroundf(slider.value)
        ////run the random number
        //targetValue = 1 + Int(arc4random_uniform(100))
        //println(targetValue);
        
        startNewGame()
        updateLabel()
        
    }


    
    @IBAction func showAlert(){
 
        //set absolute number
        var different = abs(targetValue - currentValue)
        
        //calculate point
        var point = 100 - different

        
        var title : String
        
        if different == 1 {
            title = "Perfect!"
            point += 100
        }else if different < 5 {
            title = "You almost had it!"
            if different == 1 {
                point += 50
            }
        }else if different < 10 {
            title = "Pretty good"
        }else{
            title = "not even close"
        }
        
                //calculate score
        score = score + point
        
        //increament round
        round += 1
        
        //var message : String = String (currentValue)
        
        var message = "The current value is \(currentValue) \nthe target value is \(targetValue) \nThe different value is \(different)\nYour point is \(point) \nYour score now is \(score)";
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert);
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: {
            action in
            self.startNewRound()
            self.updateLabel()
        });
   
        alert.addAction(action);
        
      
        presentViewController(alert, animated: true, completion: nil);
        
    }

    @IBAction func sliderMoved(slider : UISlider!){
        
       // println("SLider move method")
        
       // currentValue = Int (slider.value)
        currentValue = lroundf(slider.value)
        
    }
    
    func startNewRound(){
        
        targetValue = 1 + Int(arc4random_uniform(100))
        
        currentValue = 50;
        
        slider.value = Float(currentValue)
        
    }
    
    func updateLabel(){
        
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String (round)
    }
    
    func startNewGame() {
        score = 0;
        round = 0;
        startNewRound();
    }
    
    @IBAction func startOver(){
        startNewGame()
        updateLabel()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}

