//
//  DetailHomeViewController.swift
//  NavigationLoginRegister
//
//  Created by user165323 on 12/4/20.
//  Copyright © 2020 navneet. All rights reserved.
//

import UIKit

class DetailHomeViewController: UIViewController {

    
    
     @IBAction func dismissDetailHome(_ sender: Any) {
           
                  //self.navigationController?.popViewController(animated: true)
          self.dismiss(animated: true, completion: nil)
        //self.performSegue(withIdentifier: "HomeVc", sender: self)
          

         


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
