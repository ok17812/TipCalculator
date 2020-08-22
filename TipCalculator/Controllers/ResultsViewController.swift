//
//  ViewController.swift
//  TipCalculator
//
//  Created by Evan Chang on 8/22/20.
//  Copyright © 2020 Evan Chang. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var finalTipResults = 0.0
    var numOfPeopleResults = 2
    var tipAmountSendResults = 0.0
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", finalTipResults)
        settingsLabel.text = "Split between \(numOfPeopleResults), with \(tipAmountSendResults)% tip."
    }
    


    @IBAction func recalculateButton(_ sender: UIButton) {
        
    }
    
}


