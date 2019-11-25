//
//  ListTableViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/22/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var nameOfList: [List] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreData = try? context.fetch(List.fetchRequest()) as [List] {
                self.nameOfList = coreData
                tableView.reloadData()
            }
        }
    }
    
    func loadData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreData = try? context.fetch(List.fetchRequest()) as [List] {
                self.nameOfList = coreData
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nameOfList.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let selectedItem = nameOfList[indexPath.row]
        if editingStyle == .delete{
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(selectedItem)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                tableView.reloadData()
                loadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellName = nameOfList[indexPath.row]
        
        if let name = cellName.name {
           cell.textLabel?.text = (name + " " + cellName.date!)
        }
        return cell
        
    }
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedRow = nameOfList[indexPath.row]
        performSegue(withIdentifier: "listDetail", sender: tappedRow)
    }
    
    
    
}
