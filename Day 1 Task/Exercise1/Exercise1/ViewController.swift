//
//  ViewController.swift
//  Exercise1
//
//  Created by user165323 on 11/14/20.
//  Copyright © 2020 navneetKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ex4Answer: UILabel!
    @IBOutlet weak var ex4Num2: UITextField!
    @IBOutlet weak var ex4Num1: UITextField!
    @IBAction func ex3TextAction(_ sender: Any) {
        
        ex3Label.text=ex3Text.text
        
    }
    @IBAction func ex4AddBtn(_ sender: Any) {
        
        var num1 = Int(ex4Num1.text!)
        var num2 = Int(ex4Num2.text!)
        var answer = num1!   + num2!
        print(answer)
        ex4Answer.text = String(answer)
    }
    @IBOutlet weak var ex3Label: UILabel!
    @IBOutlet weak var ex3Text: UITextField!
    @IBAction func ex2Button(_ sender: Any) {
       
     
        var entryText = ex2Field.text
        ex2Label.text=entryText
        
    }
    @IBOutlet weak var ex2Field: UITextField!
    @IBOutlet weak var ex2Label: UILabel!
    @IBOutlet weak var entryLabel: UILabel!
    
    @IBOutlet weak var entryText: UITextField!
    @IBAction func tapBtn(_ sender: Any) {
        
        entryLabel.text="Hello World"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

