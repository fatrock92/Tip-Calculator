//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Fateh Singh on 3/6/17.
//  Copyright © 2017 Fateh inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentageTextFied: UITextField!
    @IBOutlet weak var sliderRangeMin: UITextField!
    @IBOutlet weak var sliderRangeMax: UITextField!
    @IBOutlet weak var splitTextField: UITextField!
    @IBOutlet weak var splitSliderMin: UITextField!
    @IBOutlet weak var splitSliderMax: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
        
        tipPercentageTextFied.text = String(tipPercentage)
        sliderRangeMin.text        = String(sliderMin)
        sliderRangeMax.text        = String(sliderMax)
        splitTextField.text        = String(split)
        splitSliderMin.text        = String(splitMin)
        splitSliderMax.text        = String(splitMax)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipPercentageTextFied.becomeFirstResponder();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults = UserDefaults.standard
        
        let tipPercentage = Int(tipPercentageTextFied.text!) ?? 0
        let sliderMin = Int(sliderRangeMin.text!) ?? 0
        let sliderMax = Int(sliderRangeMax.text!) ?? 0
        let split = Int(splitTextField.text!) ?? 0
        let splitMin = Int(splitSliderMin.text!) ?? 0
        let splitMax = Int(splitSliderMax.text!) ?? 0
        
        defaults.set(tipPercentage, forKey: "tip_percentage")
        defaults.set(sliderMin, forKey: "slider_min")
        defaults.set(sliderMax, forKey: "slider_max")
        defaults.set(split, forKey: "split")
        defaults.set(splitMin, forKey: "split_slider_min")
        defaults.set(splitMax, forKey: "split_slider_max")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
