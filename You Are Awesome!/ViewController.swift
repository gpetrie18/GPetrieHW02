//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by CSOM on 1/25/17.
//  Copyright © 2017 CSOM. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var MessageLabel: UILabel!
    
    @IBOutlet weak var MessageButton: UIButton!
   
    @IBOutlet weak var AwesomeImage: UIImageView!
    
    var awesomePlayer = AVAudioPlayer()

    
    
    var lastIndex = -1
    var lastImage = -1
    var lastSound = -1
    
    let numOfImages = 5
    let numOfSounds = 5
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName)")
        }
        
        
        
        
    }
    
    @IBAction func MessageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You Brighten My Day!",
                        "I Can't Wait To Use Your App!",
                        "You Are Da Bomb"]
        
        var randomIndex: Int = Int(arc4random_uniform(UInt32(messages.count)))
        var randomImage: Int = Int(arc4random_uniform(UInt32(numOfImages)))
        var randomSound: Int = Int(arc4random_uniform(UInt32(numOfSounds)))
       
        while randomIndex == lastIndex {
            randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        }
        MessageLabel.text = messages[randomIndex]

        lastIndex = randomIndex
        
        while randomImage == lastImage {
            randomImage = Int(arc4random_uniform(UInt32(numOfImages)))
        }
        AwesomeImage.isHidden = false
        AwesomeImage.image = UIImage(named: "image1" + String(randomImage))
        lastImage = randomImage
        
        
        //the code for making sure sounds aren't repeated follows
        while randomSound == lastSound {
            randomSound = Int(arc4random_uniform(UInt32(numOfSounds)))
        }
        playSound(soundName: "sound" + String(randomSound))
        lastSound = randomSound
        
        


        /*
        MessageLabel.text = messages[index]
        index = index+1
        
        if index == messages.count-1{
            index = 0
        } else {
            index = index+1
        }
        */
        
        
        /*
        //let message1 = "You Are Da Bomb!"
        //let message2 = "You Are Great!"
        //let message3 = "You Are Amazing!"
        
        
        if MessageLabel.text == message1 {
            MessageLabel.text = message2
        } else if MessageLabel.text == message2 {
            MessageLabel.text = message3
        } else {
            MessageLabel.text = message1
        }
 */
    }
}
