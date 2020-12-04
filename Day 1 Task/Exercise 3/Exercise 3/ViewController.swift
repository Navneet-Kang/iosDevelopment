//
//  ViewController.swift
//  Exercise 3
//
//  Created by user165323 on 11/15/20.
//  Copyright © 2020 navneetKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ex3Text: UITextField!
    @IBOutlet weak var ex3Label: UILabel!
    
    @IBAction func ex3Text(_ sender: Any) {
        ex3Label.text=ex3Text.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

