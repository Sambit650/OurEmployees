//
//  MainTableViewController.swift
//  OurEmployees
//
//  Created by Sambit Das on 19/02/20.
//  Copyright © 2020 Sambit Das. All rights reserved.
//

import UIKit


struct Value:Codable {
    let id : Int
    let full_name: String
    let gender : String
    let salary : Int
    let age : Int
   
}

class MainTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrdata: [Value]?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            getdata()
        navigationController?.navigationBar.isHidden = false
    }
    
    func getdata(){
        let url = URL(string: "https://my.api.mockaroo.com/employeedata.json?key=d4877d30")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil, let data = data{
                do{
                    print(String(data: data, encoding: .utf8) as Any)
                    self.arrdata = try JSONDecoder().decode([Value].self, from: data)
                    
                    DispatchQueue.main.async {
                       self.tableView.reloadData()
        
                    }
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if let emp = arrdata?[indexPath.row]{
            cell.idLbl.text = "Id : \(emp.id)"
            cell.NameLbl.text = "Name : \(emp.full_name)"
            cell.salaryLbl.text = "salary :\(emp.salary)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detail = self.storyboard?.instantiateViewController(withIdentifier: "detailsView") as! DetailsViewController
        
        detail.id1 = "ID :\(arrdata![indexPath.row].id)"
        //print(detail.id1)
        detail.name1 = "Name :\(arrdata![indexPath.row].full_name)"
        detail.salary1 = "Salary :\(arrdata![indexPath.row].salary)"
        detail.age1 = "Age :\(arrdata![indexPath.row].age)"
      //self.present(detail, animated: true, completion: nil)
        self.navigationController?.pushViewController(detail, animated: true)
    }

}

