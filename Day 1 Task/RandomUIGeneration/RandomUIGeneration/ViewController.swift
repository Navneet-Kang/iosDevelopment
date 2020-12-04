//
//  ViewController.swift
//  RandomUIGeneration
//
//  Created by user165323 on 11/17/20.
//  Copyright © 2020 navneetKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
  
    
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
    
    
    
    
    
    
    

    @IBAction func randomViewGen(_ sender: UIButton) {

        
        if let maxLimit = numberEntry.text {
            if(numberEntry.text!.count>0)
            {
                
            
            var maxNumber:Int = Int(maxLimit)!
            
            switch sender.tag
        {
            case 1 :
                
                for i in 1...maxNumber
                {
                    
                  let  label = UILabel(frame: CGRect(x: 40 , y: 160 + 100*i, width: 90 ,height:90))
                    label.backgroundColor = .red
                    label.text = "Hello world"
                    label.tag=99
                    self.view.addSubview(label)
                    self.view.viewWithTag(100)?.removeFromSuperview()
                    self.view.viewWithTag(101)?.removeFromSuperview()
                    
                    
                    
                }
                
            
            
            case 2 :
                
                for i in 1...maxNumber
                {
                    
                    let textField = UITextField(frame: CGRect(x: 180 ,  y: 160 + 100*i, width: 90 ,height:90))
                    textField.backgroundColor = .red
                    textField.text = "Hello world"
                    textField.tag=100
                    self.view.addSubview(textField)
                    
                    
                    self.view.viewWithTag(99)?.removeFromSuperview()
                    self.view.viewWithTag(101)?.removeFromSuperview()
                    
                }
            
            case 3 :
                
                for i in 1...maxNumber
                {
                    
                   let imageView = UIImageView(frame: CGRect(x: 300 ,  y: 160 + 100*i, width: 90 ,height:90))
                    imageView.tag=101
                    imageView.backgroundColor = .red
                    self.view.addSubview(imageView)
                    
                    
                    self.view.viewWithTag(99)?.removeFromSuperview()
                    self.view.viewWithTag(100)?.removeFromSuperview()
                }
            
        default:
            print("Break")


            
        }
        }
        
        }
    }
    @IBOutlet weak var numberEntry: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

