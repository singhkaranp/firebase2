//
//  HomeViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/21/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError{
            print("Error signing you out: %@", signOutError)
            
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
        
    }
    
}
