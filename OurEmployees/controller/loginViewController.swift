//
//  loginViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 19/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import CoreData

class loginViewController: UIViewController {

    public let req = true
    
    var lname :String!
    var lemail : String!
    var lnumber : String!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 10
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        
            let UEmail = loginEmail.text!
            let UPass = loginPassword.text!
            
            if (UEmail == "" || UPass == "")
            {
                print("TextField is Empty!")
                let alertController = UIAlertController(title: "Fill That", message:
                    "Please enter Email and Password", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "try again", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
            }
            else
            {
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                let managecontext = appdelegate.persistentContainer.viewContext
                let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
                req.predicate = NSPredicate(format: "email = %@", UEmail)
                
                req.returnsObjectsAsFaults = false
                
                do {
                    let result = try managecontext.fetch(req)
                    if !result.isEmpty{
                        for data in result as! [NSManagedObject] {
                            let passwordFromData = data.value(forKey: "password") as! String
                            lnumber = (data.value(forKey: "number") as! String)
                            lemail = (data.value(forKey: "email") as! String)
                            lname = (data.value(forKey: "name") as! String)
                            //print(lname)
                            if UPass == passwordFromData
                            {
                                print("Success to Log in")
                
                                let VC = self.storyboard?.instantiateViewController(identifier: "profileView") as! ProfileViewController
                                                       
                                                     VC.name2 = lname
                                                       VC.email2 = lemail
                                                       VC.number2 = lnumber
                                                       
                          //  self.present(VC, animated: true, completion: nil)
                                self.navigationController?.pushViewController(VC, animated: true)
                        }
                            
                    }
                        
                    }else{
                        print("not authoried")
                        let alertController = UIAlertController(title: "Invalid Email and Password", message:
                            "Please enter Valid Email and Password", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "try again", style: .default))
                        
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                } catch{
                    print("error catch")
                   
              }
                

            }
            
    }
}
