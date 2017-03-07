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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
        
        tipPercentageTextFied.text = String(tipPercentage)
        sliderRangeMin.text        = String(sliderMin)
        sliderRangeMax.text        = String(sliderMax)
        
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
        
        defaults.set(tipPercentage, forKey: "tip_percentage")
        defaults.set(sliderMin, forKey: "slider_min")
        defaults.set(sliderMax, forKey: "slider_max")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentageEditingChagned(_ sender: Any) {
        
    }

    @IBAction func sliderMinEditingChanged(_ sender: Any) {
        
    }
    
    @IBAction func sliderMaxEditingChanged(_ sender: Any) {
        
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
