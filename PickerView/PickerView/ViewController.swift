//
//  ViewController.swift
//  PickerView
//
//  Created by Muthukumar on 20/11/20.
//  Copyright © 2020 Hcl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{
    
    @IBOutlet weak var datePciker: UIDatePicker!
    @IBOutlet weak var pickerLabel: UILabel!
    
    var country1:String=""
    var year1:String=""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return country.count
        }
        else {
            return years.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return country[row]
        }
        else {
            return years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let date = datePciker.date

        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Convert Date to String
       var dateValue = dateFormatter.string(from: date)
        
        
        pickerLabel.text = country[row] + " " + years[row] + dateValue
        country1=country[row]
        year1=years[row]
        
    }
    
    var country = ["India","Australia" ,"United Kingdom","South Africa"]
    
    var years = ["1986","2004","2000","1990"]
    
    @IBOutlet weak var listPickerview: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDateActions(_ sender: Any) {
        print("the date is-->",datePciker.date)
        
        
        let date = datePciker.date

         // Create Date Formatter
         let dateFormatter = DateFormatter()

         // Convert Date to String
        var dateValue = dateFormatter.string(from: date)
         
         
         pickerLabel.text =  dateValue
    }
    
}


