//
//  ViewController.swift
//  TotalityDemoApp
//
//  Created by Apple on 08/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewOutlet: UITableView!
    
  
    var employeeVM = employeeViewModel()
    var employeeDataodel : [DetailData]?
    

    
    override func viewDidLoad() {
      
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        self.tableViewOutlet.delegate = self
//        self.tableViewOutlet.dataSource = self
        tableViewOutlet.register(UINib(nibName: "employeeTableViewCell", bundle: nil), forCellReuseIdentifier: "employeeTableViewCell")
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(sender:)))
        tableViewOutlet.addGestureRecognizer(longPress)
        
        employeeVM.employeeCall {

            DispatchQueue.main.async {
                self.employeeDataodel = self.employeeVM.employeeModelData?.data
                self.tableViewOutlet.delegate = self
                self.tableViewOutlet.dataSource = self
                self.tableViewOutlet.reloadData()
            }
            
        }
        
        
    }
   

    @objc private func handleLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let touchPoint = sender.location(in: tableViewOutlet)
            if let indexPath = tableViewOutlet.indexPathForRow(at: touchPoint) {
                AlertOption(index: indexPath)
            }
        }
    }
    
   
    }

    


extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return     employeeDataodel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTableViewCell", for: indexPath) as? employeeTableViewCell
        let DataValue = employeeDataodel![indexPath.row]
        cell?.emNameOutlet.text =  DataValue.employeeName
        cell?.ageOutlet.text =   "Age : \(DataValue.employeeAge!)"
        cell?.salaryOutlet.text = "Salary : \(DataValue.employeeSalary!)"
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension ViewController {
    func AlertOption (index : IndexPath) {
        let alert = UIAlertController(title: "", message: "Delete or Copy employee information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "delete", style: .destructive, handler: { action in
            self.employeeDataodel?.remove(at: index.row)
            self.tableViewOutlet.deleteRows(at: [index], with: .automatic)
            self.tableViewOutlet.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { action in
            
            
            let cell = self.tableViewOutlet.cellForRow(at: index)
            UIPasteboard.general.string =  self.employeeDataodel![index.row].employeeName! + "\n Age : \(self.employeeDataodel![index.row].employeeAge!)" + "\n Salary : \(self.employeeDataodel![index.row].employeeSalary!)"
//            UIPasteboard.general.string =  "\(self.employeeDataodel![index.row].employeeAge!)"
//            UIPasteboard.general.string =  "\(self.employeeDataodel![index.row].employeeSalary!)"
            
            
//            let alertText = UIAlertController(title: "Some Title", message: "Enter a text", preferredStyle: .alert)
//
//            //2. Add the text field. You can configure it however you need.
//            alertText.addTextField { (textField) in
//                textField.text = "\(self.employeeDataodel![index.row].employeeName)"
//            }
//
//            // 3. Grab the value from the text field, and print it when the user clicks OK.
//            alertText.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//                let textField = alertText.textFields![0] // Force unwrapping because we know it exists.
//                print("Text field: \(textField.text)")
//            }))
//
//            // 4. Present the alert.
//            self.present(alertText, animated: true, completion: nil)
//            print("action")
            
//
        }))
        
        
        self.present(alert, animated: true, completion: nil)
        // your code here, get the row for the indexPath or do whatever you want
    }
}
