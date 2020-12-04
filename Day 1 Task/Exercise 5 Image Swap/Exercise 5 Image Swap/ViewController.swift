//
//  ViewController.swift
//  Exercise 5 Image Swap
//
//  Created by user165323 on 11/15/20.
//  Copyright © 2020 navneetKang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img1: UIImageView!
    var images = [#imageLiteral(resourceName: "1") , #imageLiteral(resourceName: "2") , #imageLiteral(resourceName: "3") ,#imageLiteral(resourceName: "4")]
    var count = 1
    
    @IBAction func ex5Btn(_ sender: Any) {
       count+=1
        if(count%2==0)
        {
             images = [#imageLiteral(resourceName: "4") , #imageLiteral(resourceName: "3") , #imageLiteral(resourceName: "2") ,#imageLiteral(resourceName: "1")]
            setImage()
        }
        else
        {
           images = [#imageLiteral(resourceName: "1") , #imageLiteral(resourceName: "2") , #imageLiteral(resourceName: "3") ,#imageLiteral(resourceName: "4")]
            setImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         setImage()
        
    }
    
    func setImage()
    {
        img1.image = images[0]
        img2.image = images[1]
        img3.image = images[2]
        img4.image = images[3]
    }
    


}

