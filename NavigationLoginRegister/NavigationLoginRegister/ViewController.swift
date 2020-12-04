//
//  ViewController.swift
//  NavigationLoginRegister
//
//  Created by user165323 on 12/4/20.
//  Copyright © 2020 navneet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBAction func registerBtn(_ sender: Any) {
        
        self.performSegue(withIdentifier: "DetailVc", sender: self)

    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        return true
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

