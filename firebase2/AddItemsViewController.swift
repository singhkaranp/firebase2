//
//  AddItemsViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/22/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit

class AddItemsViewController: UIViewController {
    var sendInfoToListofItemsVC = ListOfItemsTableViewController()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var isImportantSwitch: UISwitch!
    
    
    
    @IBOutlet weak var doneButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.layer.cornerRadius = doneButton.frame.size.height / 2
       
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
      if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
          let newItem = Items(context: context)
        newItem.name = nameTextField.text
        newItem.isImportant = isImportantSwitch.isOn
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
        
    }
    
    

}
