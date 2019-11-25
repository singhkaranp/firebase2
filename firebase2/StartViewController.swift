//
//  StartViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/21/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil{
            performSegue(withIdentifier: "startToHome", sender: self)
        }
    }
    
    
}
//@IBAction func logOutButtonTapped(_ sender: Any) {
//      do{
//          try Auth.auth().signOut()
//      }
//      catch let signOutError as NSError{
//          print("Error signing you out: %@", signOutError)
//
//      }
//
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      let initial = storyboard.instantiateInitialViewController()
//      UIApplication.shared.keyWindow?.rootViewController = initial
//
//  }
