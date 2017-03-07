//
//  ViewController.swift
//  TipCal
//
//  Created by Fateh Singh on 3/4/17.
//  Copyright © 2017 Fateh inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        var tipPercentage = 15
        var sliderMin = 0
        var sliderMax = 30
        
        if ((defaults.object(forKey: "tip_percentage")) != nil) {
            print("Not Nil\n")
            tipPercentage = defaults.integer(forKey: "tip_percentage")
            sliderMin = defaults.integer(forKey: "slider_min")
            sliderMax = defaults.integer(forKey: "slider_max")
        }
        
        tipPercentageSlider.maximumValue = Float(sliderMax)
        tipPercentageSlider.minimumValue = Float(sliderMin)
        tipPercentageSlider.value        = Float(tipPercentage)
        tipPercentageLabel.text          = String(tipPercentage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
        let val = Int(tipPercentageSlider.value)
        tipPercentageLabel.text = String(val) + "%"
        
        let bill = Double(billTextField.text!) ?? 0
        let tip  = Double(val)
        let total = Double(bill*tip/100)
        tipLabel.text = String(format: "$%.2f", total)
        totalLabel.text = String(format: "$%.2f", total+bill)
    }
    @IBAction func billEditingChanged(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        let tipPercentage = (tipPercentageLabel.text)?.characters.split{$0 == "%"}.map(String.init)
        let tip  = Double((tipPercentage?[0])!) ?? 0
        let total = Double(bill*tip/100)
        tipLabel.text = String(format: "$%.2f", total)
        totalLabel.text = String(format: "$%.2f", total+bill)
    }
    
}

