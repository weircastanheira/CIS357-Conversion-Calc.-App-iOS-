//
//  ViewController.swift
//  cis357hw3
//
//  Created by Filipe Castanheira & Michael Weir
//  on 9/17/18.
//  Copyright © 2018 Workbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
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
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        var pwOk = false
        if let pw = self.passField.text {
            if pw != "" {
                pwOk = true
            }
        }
        if !pwOk {
            print("Password cannot be blank")
        }
        
        var emailOk = false
        if let email = self.emailField.text {
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", regex)
            emailOk = emailPredicate.evaluate(with: email)
        }
        if !emailOk {
            print("Invalid email address")
        }
    }
    
}

