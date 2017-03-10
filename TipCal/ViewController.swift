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
    @IBOutlet weak var splitSliderLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    
    
    @IBAction func OnTap(_ sender: Any) {
        view.endEditing(true)
    }
    
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
        var split = 3
        var splitMin = 1
        var splitMax = 5
        
        if ((defaults.object(forKey: "split")) != nil) {
            tipPercentage   = defaults.integer(forKey: "tip_percentage")
            sliderMin       = defaults.integer(forKey: "slider_min")
            sliderMax       = defaults.integer(forKey: "slider_max")
            split           = defaults.integer(forKey: "split")
            splitMin        = defaults.integer(forKey: "split_slider_min")
            splitMax        = defaults.integer(forKey: "split_slider_max")
        }
        
        tipPercentageSlider.minimumValue = Float(sliderMin)
        tipPercentageSlider.maximumValue = Float(sliderMax)
        tipPercentageSlider.value        = Float(tipPercentage)
        tipPercentageLabel.text          = String(tipPercentage) + "%"
        splitSlider.minimumValue         = Float(splitMin)
        splitSlider.maximumValue         = Float(splitMax)
        splitSlider.value                = Float(split)
        splitSliderLabel.text            = String(split)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func convertIntToString(_ number: Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let priceString = currencyFormatter.string(from: NSNumber(value: number))
        return priceString!
    }
    
    public func convertoStringToInt(_ string: String) -> Double {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        let price = currencyFormatter.number(from: string)
        return price as! Double
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let val = Int(tipPercentageSlider.value)
        tipPercentageLabel.text = String(val) + "%"
        
        let bill = Double(billTextField.text!) ?? 0
        let tip  = Double(val)
        let total = Double(bill*tip/100)
        let splitVal = Int(splitSlider.value)
        let splitAmount = (total+bill) / Double(splitVal)
        
        splitLabel.text = convertIntToString(splitAmount)
        tipLabel.text = convertIntToString(total)
        totalLabel.text = convertIntToString(total+bill)
    }
    @IBAction func billEditingChanged(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        let tipPercentage = (tipPercentageLabel.text)?.characters.split{$0 == "%"}.map(String.init)
        let tip  = Double((tipPercentage?[0])!) ?? 0
        let total = Double(bill*tip/100)
        let splitVal = Int(splitSlider.value)
        let splitAmount = (total+bill) / Double(splitVal)
        
        splitLabel.text = convertIntToString(splitAmount)
        tipLabel.text = convertIntToString(total)
        totalLabel.text = convertIntToString(total+bill)
    }
    
    @IBAction func splitSliderValueChanged(_ sender: Any) {
        let splitVal = Int(splitSlider.value)
        splitSliderLabel.text = String(splitVal)
        
        let totalString = totalLabel.text ?? ""
        let total = convertoStringToInt(totalString)
        let splitAmount =  total / Double(splitVal)
        splitLabel.text = convertIntToString(splitAmount)
    }
}

