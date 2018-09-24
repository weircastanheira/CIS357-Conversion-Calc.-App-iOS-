//
//  ViewController.swift
//  cis357hw3
//
//  Created by Filipe Castanheira & Michael Weir
//  on 9/17/18.
//  Copyright © 2018 Workbook. All rights reserved.
//

import UIKit

//protocol lengthSelectionViewController{
//    func indicateSelection(vice: String)
//
//}

class ViewController: UIViewController, UITextFieldDelegate{
    

    
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
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        if let d = self.delegate {
//            d.indicateSelection(vice: selection)
//        }
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let dest = segue.destination as? ViewController{
//
//            dest.delegate = self
//        }
//    }
//    func indicateSelection(vice: String) {
//        self.fromUnits.text = vice
//    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        var yardsOk = false

        if let yards = self.yardsField.text {
            if yards != "" {
                yardsOk = true
              
            }
        }
        if !yardsOk {
            print("Please enter a length!")
        }
        
        
        
        
    }
    
    

}









    
    


