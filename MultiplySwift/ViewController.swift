//
//  ViewController.swift
//  MultiplySwift
//
//  Created by Rockstar. on 6/1/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var selectorSegmentControl: UISegmentedControl!
    @IBOutlet weak var multiplierLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!

    var multiplier:Int!
    var result:Int!

    override func viewDidLoad() {
        super.viewDidLoad()


        //Set up slider, set initial value of 10 and make it animated.
        //Set slider to be continous and set a min and max value.
        //Add target to for event value change of slider from 0 - 10.
        numberSlider.setValue(10.0, animated: true)
        numberSlider.continuous = true
        numberSlider.minimumValue = 0.0
        numberSlider.maximumValue = 10.0
        numberSlider.addTarget(self, action: Selector("updateNumber:"), forControlEvents:.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Actions
    @IBAction func onCalculateButtonTapped(sender: UIButton) {
        multiplier = Int(numberSlider.value)
        let numberEntered = inputTextField.text.toInt()

        //--------------------------
        // Operands using index of segmented control.
        //--------------------------

        // Index 0 = multiplication
        // Index 1 = division
        // Index 2 = addition
        // INdex 3 = substraction

        switch (selectorSegmentControl.selectedSegmentIndex){
        case 0: result = numberEntered! * multiplier
        case 1: result = numberEntered! / multiplier
        case 2: result = numberEntered! + multiplier
        case 3: result = numberEntered! - multiplier
        default: 0
        }

        // Store operation final value.
        // Update label with final value.
        let finalResult = NSString(format: "%i", result!)
        resultLabel.text = finalResult as String

        //CHange screen depending on final result
        if (result >= 20) {
            view.backgroundColor = UIColor.greenColor()
        } else {
            view.backgroundColor = UIColor.whiteColor()
        }

        //------------
        // FizzBuzz
        //------------
//        for var i = 0; i < 101; i++ {
//            if (i % 3 == 0) && (i % 5 == 0) {
//                println("FizzBuzz")
//            } else if (i % 3 == 0) {
//                println("Fizz")
//            } else if (i % 5 == 0) {
//                println("Buzz")
//            } else {
//                println(i)
//            }
//        }

        if (result! % 3 == 0 && result! % 5 == 0) {
            resultLabel.text = NSString(format: "%i, FizzBuss", result!) as String
        } else if (result! % 5 == 0) {
            resultLabel.text = NSString(format: "%i, Buzz", result!) as String
        } else if (result! % 3 == 0) {
            resultLabel.text = NSString(format: "%i, Fizz", result!) as String
        } else {
            resultLabel.text = finalResult as String
        }

        //------------------
        // Dismiss Keyboard
        //------------------
        inputTextField.resignFirstResponder()
    }

    @IBAction func updateNumber(sender: UISlider) {
        var value = Int(sender.value)
        multiplierLabel.text = NSString(format: "\(value)") as String
        multiplier = value
    }


    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
}

