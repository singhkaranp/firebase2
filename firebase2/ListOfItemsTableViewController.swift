//
//  ListOfItemsTableViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/22/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit

class ListOfItemsTableViewController: UITableViewController {
    var items : [Items] = []
    
    //created a function so that we can call it later to change the background color of the row
    func setCell(color: UIColor, at indexPath: IndexPath) {
        self.view.backgroundColor = color
        let cell = tableView.cellForRow(at:indexPath)
        cell?.backgroundColor  = color
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completedAction = UIContextualAction(style: .normal, title: "Completed") { (action, view, actionPerformed) in
            //boolValue(true)
            self.setCell(color: .green, at: indexPath)
            }
        completedAction.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [completedAction])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
          if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
              if let coreData = try? context.fetch(Items.fetchRequest()) as? [Items]{
                  items = coreData
                tableView.reloadData()
              }
          }
      }
      
    func itemListLoad() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreData = try? context.fetch(Items.fetchRequest()) as? [Items]{
                items = coreData
                tableView.reloadData()
            }
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let things = items[indexPath.row]
        
        if things.isImportant {
            if let name = things.name{
                cell.textLabel?.text = "❗️" + name
            }
            
        } else {
            cell.textLabel?.text = things.name
        }
        
        return cell
    }
    
    
    
    
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//        let contextItem = UIContextualAction(style: .normal, title: "complete") { (contextualAction, view, boolValue) in
//            boolValue(true)
//            }
//        contextItem.backgroundColor = UIColor(red: 0.0, green: 0.61, blue: 0.02, alpha: 1.0)
//        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
//        return swipeActions
//    }
    
}
