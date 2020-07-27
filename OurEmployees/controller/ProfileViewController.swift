//
//  ProfileViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 18/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import CoreData



 let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
class ProfileViewController: UIViewController {
    
    var name2 : String!
    var email2 : String!
    var number2 : String!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    @IBOutlet weak var showEmployeeView: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        signOutButton.layer.cornerRadius = 10
        showEmployeeView.layer.cornerRadius = 10
        userName.text = "Name : \(name2!)"
        userEmail.text = "Email : \(email2!)"
        userNumber.text = "Number : \(number2!)"
        //navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
         //navigationController?.navigationBar.isHidden = true
    }
    @IBAction func ShowEmployeeDetails(_ sender: Any) {
    
        self.performSegue(withIdentifier: "p2T", sender: nil)
        
    }
    
    @IBAction func onClickSignout(_ sender: Any) {
     navigationController?.popToRootViewController(animated: true)
    }
    

}
