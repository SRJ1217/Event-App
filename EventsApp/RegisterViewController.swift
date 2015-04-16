//
//  RegisterViewController.swift
//  EventsApp
//
//  Created by sjonske on 4/7/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
    }
    
    @IBAction func registerButtonTapped(sender: UIButton)
    {
        if usernameTextField.text == "" || passwordTextField == ""
        {
            showAlert("Please enter a username and password.", nil, self)
        }
        else
        {
            User.registerNewUser(usernameTextField.text, password: passwordTextField.text, completed: { (result, error) -> Void in
                if error != nil
                {println("ShowError")
                    showAlertWithError(error, self)
                    
                }
                else
                {println("dismiss")
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
        }
    }
    
  
 

}
