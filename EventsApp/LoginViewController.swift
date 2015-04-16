//
//  LoginViewController.swift
//  EventsApp
//
//  Created by sjonske on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onLoginButtonTapped(sender: UIButton)
    {
       
        if usernameTextField.text == "" || passwordTextField == ""
        {
            showAlert("Please enter a username and password.", nil, self)
        }
        else
        {
            println("reg try")
            User.registerNewUser(usernameTextField.text, password: passwordTextField.text, completed: { (result, error) -> Void in
                if error != nil
                {
                    showAlertWithError(error, self)
                    println("Login")
                }
                else
                {
                    User.loginUser(self.usernameTextField.text, password: self.passwordTextField.text, completed: { (result, error) -> Void in
                        if error != nil
                        {
                            showAlertWithError(error, self)
                            println("register")
                        }
                        else
                        {
                            self.dismissViewControllerAnimated(true, completion: nil)
                            
                        }
                    })
                    
                }
            })
        }
    }

  

}
