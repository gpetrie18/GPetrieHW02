//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by CSOM on 1/25/17.
//  Copyright © 2017 CSOM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MessageLabel: UILabel!
    
    @IBOutlet weak var MessageButton: UIButton!

    var index = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func MessageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You Brighten My Day!",
                        "I Can't Wait To Use Your App!"]
        
        
        MessageLabel.text = messages[index]
        index = index+1
        
        if index == messages.count-1{
            index = 0
        } else {
            index = index+1
        }
        
        
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
