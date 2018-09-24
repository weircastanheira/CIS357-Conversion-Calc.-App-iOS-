//
//  ViewController.swift
//  cis357hw3
//
//  Created by Filipe Castanheira & Michael Weir
//  on 9/17/18.
//  Copyright © 2018 Workbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, lengthSelectionViewControllerDelegate{
    
    @IBOutlet weak var fromField: DecimalMinusTextField!
    
    
    @IBOutlet weak var toField: DecimalMinusTextField!
    
    func indicateSelection(vice: String) {
        self.fromField.text = vice
    }
    
    

    
    
    

    
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
        if let dest = segue.destination as? lengthPickerViewController{
            
                    dest.delegate = self
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
   
    @IBAction func clearPressed(_ sender: Any) {
        fromField.text = ""
        toField.text = ""
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        var yardsOk = false

        if let yards = self.fromField.text {
            if yards != "" {
                yardsOk = true
              
            }
        }
        if !yardsOk {
            print("Please enter a length!")
        }
        
        
        
        
    }
    
    

}









    
    


