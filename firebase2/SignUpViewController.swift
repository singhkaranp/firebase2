//
//  SignUpViewController.swift
//  firebase2
//
//  Created by Karan Singh on 11/21/19.
//  Copyright © 2019 Karan Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if passwordTextField.text != confirmPasswordTextField.text {
            
            let alertController = UIAlertController(title: "Incorrect Password", message: "Please try again", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){(user, error) in
                
                if error == nil{
                    self.performSegue(withIdentifier: "signUpToHome", sender: self)
                }
                    
                else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
    }
}



