//
//  CreateListViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/22/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit

class CreateListViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var sendInfoToListTableVC = ListTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let timeStamp = formatter.string(from: currentDate)
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let listname = List(context: context)
            listname.name = nameTextField.text
            listname.date = timeStamp
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
        
    }

