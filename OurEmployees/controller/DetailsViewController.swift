//
//  DetailsViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 19/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var DId: UILabel!
    @IBOutlet weak var Dname: UILabel!
    @IBOutlet weak var Dsalary: UILabel!
    @IBOutlet weak var Dage: UILabel!
    
    var id1 = ""
    var name1  = ""
    var salary1 = ""
    var age1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DId.text = id1
        Dname.text = name1
        Dsalary.text = salary1
        Dage.text = age1

    
    }
    

}
