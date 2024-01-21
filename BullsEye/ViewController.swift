//
//  ViewController.swift
//  BullsEye
//
//  Created by Austin Sparks on 1/20/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    
    var currentValue: Int = 50
    var targetValue = 0
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
     targetLabel.text = String(targetValue)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        var difference: Int
        
        if currentValue > targetValue {
         difference = currentValue - targetValue
        } else if targetValue > currentValue {
         difference = targetValue - currentValue
        } else {
         difference = 0
        }
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)" +
                      "\nThe difference is: \(difference)" 
        
        let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

}

