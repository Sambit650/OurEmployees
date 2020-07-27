//
//  SignupViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 19/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit
import CoreData

class SignupViewController: UIViewController {
    
    public let req = false

    @IBOutlet weak var signupName: UITextField!
    @IBOutlet weak var signupNumber: UITextField!
    @IBOutlet weak var signupEmail: UITextField!
    @IBOutlet weak var signupPassword: UITextField!
    @IBOutlet weak var signupRepassword: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signupButton.layer.cornerRadius = 10
    }
    
    @IBAction func signupButtonTapped(_ sender: AnyObject) {
      
        let nameText = signupName.text
        let numberText = signupNumber.text
        let emailText = signupEmail.text
        let passwordText = signupPassword.text
        let reppaordText = signupRepassword.text

        if( nameText!.isEmpty || numberText!.isEmpty || emailText!.isEmpty || passwordText!.isEmpty || reppaordText!.isEmpty){
            
            print("Fill all the textfills")
           let alertController = UIAlertController(title: "All textfields are compulsory", message:
               "Please fill all required fields ", preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "try again", style: .default))
           
           self.present(alertController, animated: true, completion: nil)
            
        }else if(passwordText != reppaordText){
            
                let alertController = UIAlertController(title: "Confirm password is not matched", message:
                    "Please Enter your correct password ", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "try again", style: .default))
                
                self.present(alertController, animated: true, completion: nil)
    
        }
        
        
        else{
        
        
        let dict = ["name": signupName.text,"number": signupNumber.text,"email":signupEmail.text,"password":signupPassword.text]
    
            save(object: dict as! [String : String])
        
       // self.performSegue(withIdentifier: "signupToProfile", sender: self)
            
      
            let VC = self.storyboard?.instantiateViewController(identifier: "profileView") as! ProfileViewController
              
            VC.name2 = nameText
              VC.email2 = emailText
              VC.number2 = numberText
              
             // self.present(VC, animated: true, completion: nil)
            self.navigationController?.pushViewController(VC, animated: true)
            
            
        }
    }
    func save(object:[String : String]){
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!) as! Employee
        employee.name = object["name"]
        employee.email = object["email"]
        employee.number = object["number"]
        employee.password = object["password"]
        
        do{
            try context?.save()
            print("data is save")
        }catch{
            print("data is not save")
        }
    }


    
}
