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

    // Mark: Properties
    @IBOutlet weak var MessageLabel: UILabel!
    
    @IBOutlet weak var MessageButton: UIButton!
   
    @IBOutlet weak var AwesomeImage: UIImageView!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    
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
    
    func nonRepeatedRandom(last: inout Int, range: Int) ->Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        last = random
        
        return random
    }
    
    // Mark: Actions
    
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false {
            awesomePlayer.stop()
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
        
        var random: Int
        
        random = nonRepeatedRandom(last: &lastIndex, range: messages.count)
        
        MessageLabel.text = messages[random]
        
        AwesomeImage.isHidden = false
        random = nonRepeatedRandom(last: &lastImage, range: numOfImages)
        AwesomeImage.image = UIImage(named: "image1" + String(random))
        
        
        if soundSwitch.isOn {
            random = nonRepeatedRandom(last: &lastSound, range: numOfSounds)
            playSound(soundName: "sound" + String(random))
        }

    
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
