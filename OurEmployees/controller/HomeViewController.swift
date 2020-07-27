//
//  ViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 18/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var LogIn: UIView!
    @IBOutlet weak var Signup: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func RadioButton(_ sender: Any) {
        if (sender as AnyObject).selectedSegmentIndex == 0 {
               LogIn.alpha = 1
               Signup.alpha = 0
           } else {
               LogIn.alpha = 0
               Signup.alpha = 1
           }    }
   

}

