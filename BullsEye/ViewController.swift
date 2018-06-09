//
//  ViewController.swift
//  BullsEye
//
//  Created by Amy Adair on 06/06/2018.
//  Copyright © 2018 Amy Adair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//sets the variable to hold intialize value of 0
    var currentValue: Int = 0
    //initalize the variable
    @IBOutlet weak var slider: UISlider!
    //creating target value
    var targetValue: Int = 0

    @IBOutlet weak var targetLabel: UILabel!

    
    //the veiw controller isnt visble yet,so the view did load runs when app starts
    //good to set instance variables to their intial values
    override func viewDidLoad() {
        super.viewDidLoad()
        //when app starts up it will set it up to the correct intial value
    currentValue = lroundf(slider.value)
        //gives you a random number up to but not including whatever value you type in in the ()
        startNewRound() //calls method starts new one
    }
    
    //updates the target value each time
    func updateLabels() {
        targetLabel.text = String (targetValue)
    }
    //METHODS
    //stores all the code about the round
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))//sets the target value
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    //UI-slider- type of parameter
    // (_) means you can just call the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
    print ("The value of the slider is now: \(slider.value)")
        
        //as the variable is stored as an int, you need to convert so it will store a float value
        currentValue = lroundf(slider.value)
        
    //the value of the slider will be printed into the string
        
    }
    
    
    @IBAction func targetGenerated() {
    targetValue = 1 + Int(arc4random_uniform(100))
       

        
    }

    //When you click the button, you show a pop up button
    @IBAction func showAlert() {
        
        //create variabe to show difference
        var difference: Int
        if currentValue > targetValue {
            difference = currentValue - targetValue
        }
        else if
            targetValue > currentValue {
            difference = targetValue - currentValue
        } else {
            difference = 0
        }
        
        //shows a message of the current value
        let message = "The Value of the slider is: \(currentValue)" +
            "\nThe target value is: \(targetValue)" + "\n The difference is: \(difference)"
        //created alerter controller, the 'message' takes what is in the variable
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
        
        //connecting button to alert
        alert.addAction(action)
    
//presenting alert on screen
        present (alert,animated: true, completion: nil)
        
        startNewRound()
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

