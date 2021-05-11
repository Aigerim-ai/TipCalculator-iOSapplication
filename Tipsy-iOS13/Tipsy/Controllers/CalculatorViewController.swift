//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tip = 0.1
    var numberofPeople = 0
    
    var totalbillamount = 0.00
    
    var finalcalculation = 0.00
    
    var convertedToTwoDecimal = "0.00"
    
    var setting = "set"
    

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
 
    
    
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonSelectedTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonSelectedTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
         tip = buttonTitleAsANumber/100
   
        
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String( format:"%.0f", sender.value)
        numberofPeople = Int(sender.value)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        totalbillamount = Double(billTextField.text!) ?? 0.00
        
        finalcalculation = (totalbillamount+tip*totalbillamount)/Double(numberofPeople)
        
        convertedToTwoDecimal = String(format: "%0.2f", finalcalculation)
        
        setting = "split between \(numberofPeople) people, with \(tip*100)% tip."
      
        performSegue(withIdentifier: "goToResult", sender: self)
        
       
   
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "goToResult" {
              let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipvalue = convertedToTwoDecimal
            destinationVC.texting = setting
              
          }
      }
}

