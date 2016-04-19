//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Mark Rabins on 4/18/16.
//  Copyright © 2016 self.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var tipTextField: UITextField!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var tipTitleLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalTitleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var implicitlyConvertButton: UIButton!
    
    var tipValue: Double? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 102/255, green: 205/255, blue: 170/255, alpha: 1.0)
        signLabel.textColor = UIColor.blackColor()
        tipTextField.placeholder = "Enter Tip:"
        percentButton.setBackgroundImage(UIImage(named: "convertButton"), forState: UIControlState.Normal)
        tipTitleLabel.textColor = UIColor.whiteColor()
        tipTitleLabel.text = "Tip"
        tipLabel.text = "0"
        tipLabel.textColor = UIColor.whiteColor()
        totalTitleLabel.text = "Total"
        totalTitleLabel.textColor = UIColor.whiteColor()
        implicitlyConvertButton.backgroundColor = UIColor.lightGrayColor()
        implicitlyConvertButton.setTitle("Implicitly Convert", forState: UIControlState.Normal)
        totalLabel.text = "0"
        implicitlyConvertButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        tipTextField.keyboardType = UIKeyboardType.NumberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func precentButton(sender: UIButton) {
        tipTextField.resignFirstResponder()
        
        if  tipTextField.text != nil {
            if tipTextField.text! != "" {
                if tipValue != nil {
                    if tipValue! != 0 {
                        tipLabel.text = "\(tipValue!)"
                        let totalWithTip = tipValue! + Double (tipTextField.text!)!
                        totalLabel.text = "\(totalWithTip)"
                    } else {
                        tipLabel.text = "No Tip"
                        totalLabel.text = "\(tipTextField.text!)"
                        
                    }
                } else {
                        tipLabel.text = "Tip is nil"
                        totalLabel.text = "\(tipTextField.text!)"
                    }
                        
            }
    }
        

}

    @IBAction func implicitlyConvert(sender: UIButton) {
        tipTextField.resignFirstResponder()

        let total = Double(tipTextField.text!)
        
        if let upwrappedTotal = total {
            if let tipValueToUse = tipValue {
                tipLabel.text = "\(tipValueToUse)"
                
                let amountToPay = upwrappedTotal + tipValueToUse
                totalLabel.text = "\(amountToPay)"
                
            } else {
                tipLabel.text = "Tip is Nil"
                totalLabel.text = "\(upwrappedTotal)"
            }
            
        } else {
            print("Optional way nil!")
        }
        
    
    
    
}



}

