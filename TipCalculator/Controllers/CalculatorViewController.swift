//
//  CalculatorViewController.swift
//  TipCalculator
//
//  Created by Evan Chang on 8/22/20.
//  Copyright © 2020 Evan Chang. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tipCounter = 0.0
    var numOfPeople = 2
    var finalTip = 0.0
    var tipAmountSend = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        
        sender.isSelected = true
        let tipAmountWithPercentString = sender.currentTitle!
        let tipAmountString = String(tipAmountWithPercentString.dropLast())
        let tipAmount = Double(tipAmountString)!
        let finalAmount = tipAmount/100
        tipAmountSend = tipAmount
        tipCounter = finalAmount
        
 
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numOfPeople = Int(sender.value)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let total = (billTextField.text!)
        finalTip = (Double(total)!+(Double(total)!*tipCounter)) / Double(numOfPeople)
        self.performSegue(withIdentifier: "goToResults", sender: self)
        print(String(format: "%.2f",finalTip))
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalTipResults = finalTip
            destinationVC.numOfPeopleResults = numOfPeople
            destinationVC.tipAmountSendResults = tipAmountSend
            
        }
    }
    
}

