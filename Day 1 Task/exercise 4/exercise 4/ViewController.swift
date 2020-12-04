//
//  ViewController.swift
//  exercise 4
//
//  Created by user165323 on 11/15/20.
//  Copyright © 2020 navneetKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Add(_ sender: Any) {
        print(ex4Text2.text)
        if(ex4Text1.text! != "" && ex4Text2.text! != "")
        {
            
            var num1 = Int(ex4Text1.text!)
                     var num2 = Int(ex4Text2.text!)
                     var answer = num1!   + num2!
                     print(answer)
                     ex4Answer.text = String(answer)
            
        }
        else
        {
          ex4Answer.text = "Enter Both Number"
            
        }
         
        
    }
    @IBOutlet weak var ex4Answer: UILabel!
    @IBOutlet weak var ex4Text2: UITextField!
    @IBOutlet weak var ex4Text1: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

