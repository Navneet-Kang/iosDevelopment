//
//  SecondViewController.swift
//  NavigationLoginRegister
//
//  Created by user165323 on 12/4/20.
//  Copyright © 2020 navneet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func dismissBtn(_ sender: Any) {
        
              //    self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)


    }
    
    
    @IBAction func logInBtn(_ sender: Any) {
        
                self.performSegue(withIdentifier: "HomeVc", sender: self)

      


    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
