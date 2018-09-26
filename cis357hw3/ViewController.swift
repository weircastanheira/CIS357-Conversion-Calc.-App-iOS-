//
//  ViewController.swift
//  cis357hw3
//
//  Created by Filipe Castanheira & Michael Weir
//  on 9/17/18.
//  Copyright © 2018 Workbook. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate,lengthSelectionViewController{

    
    
    func settingsChanged(fromUnits: String, toUnits: String) {
        input.text = fromUnits
        output.text = toUnits
    }


    @IBOutlet weak var input: UILabel!
    @IBOutlet weak var output: UILabel!
    var mode: String? = CalculatorMode.Length.rawValue
    var whatMode: Int = 1
    
    

    
    @IBOutlet weak var yardsField: DecimalMinusTextField!
    //UITextField!
    
    
    @IBOutlet weak var metersField: DecimalMinusTextField!
    
   // var pickerdata : [String] = [String]()
 
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        

        // Do any additional setup after loading the view, typically from a nib.
        
        // dismiss keyboard when tapping outside oftext fields
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination.childViewControllers[0] as? lengthPickerViewController{
            dest.whichMode = whatMode
//            dest.fromUnits = input
//            dest.toUnits = output]
            dest.fromStr = input.text!
            dest.toStr = output.text!
            dest.delegate = self
        }
    }

    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {

        if self.yardsField.text == "" && self.metersField.text != ""{
        if mode! == CalculatorMode.Length.rawValue{
            let i = LengthUnit(rawValue: self.input.text!)
            let j = LengthUnit(rawValue: self.output.text!)
            let key = LengthConversionKey(toUnits: i!, fromUnits: j!)
            let jDouble = Double(self.metersField.text!)
            let calc = jDouble! * lengthConversionTable[key]!
            self.yardsField.text = String(calc)
        }
        else if mode! == CalculatorMode.Volume.rawValue{
            let i = VolumeUnit(rawValue: self.input.text!)
            let j = VolumeUnit(rawValue: self.output.text!)
            let key = VolumeConversionKey(toUnits: i!, fromUnits: j!)
            let jDouble = Double(self.metersField.text!)
            let calc = jDouble! * volumeConversionTable[key]!
            self.yardsField.text = String(calc)
        }
        else{
            print("Error calculating")
        }
        }
        else if self.yardsField.text != "" && self.metersField.text == ""{
            if mode! == CalculatorMode.Length.rawValue{
                let i = LengthUnit(rawValue: self.input.text!)
                let j = LengthUnit(rawValue: self.output.text!)
                let key = LengthConversionKey(toUnits: j!, fromUnits: i!)
                let jDouble = Double(self.yardsField.text!)
                let calc = jDouble! * lengthConversionTable[key]!
                self.metersField.text = String(calc)
            }
            else if mode! == CalculatorMode.Volume.rawValue{
                let i = VolumeUnit(rawValue: self.input.text!)
                let j = VolumeUnit(rawValue: self.output.text!)
                let key = VolumeConversionKey(toUnits: j!, fromUnits: i!)
                let jDouble = Double(self.yardsField.text!)
                let calc = jDouble! * volumeConversionTable[key]!
                self.metersField.text = String(calc)
            }
            else{
                print("Error calculating")
            }
            
            }
        else{
            print("Enter a value in a field!")
                self.yardsField.text = ""
                self.metersField.text = ""
            }
        dismissKeyboard()
        }
    
    
    @IBAction func modePressed(_ sender: Any) {
        if mode! == CalculatorMode.Length.rawValue{
        whatMode = 2
        mode = CalculatorMode.Volume.rawValue
        input.text = VolumeUnit.Gallons.rawValue
        output.text = VolumeUnit.Liters.rawValue
    }
        else if mode! == CalculatorMode.Volume.rawValue{
        whatMode = 1
        mode = CalculatorMode.Length.rawValue
        input.text = LengthUnit.Yards.rawValue
        output.text = LengthUnit.Meters.rawValue
            
                
        
        }
        else{
            print("Error choosing mode")
        }
        
        yardsField.text = ""
        metersField.text = ""
        dismissKeyboard()
    }
    
 
    
    
    @IBAction func clearPressed(_ sender: Any) {
        metersField.text = ""
        yardsField.text = ""
    }
    

}









    
    


