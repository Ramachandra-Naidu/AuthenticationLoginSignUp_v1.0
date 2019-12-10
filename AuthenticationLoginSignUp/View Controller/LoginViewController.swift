//
//  LoginViewController.swift
//  AuthenticationLoginSignUp
//
//  Created by ramachandra on 29/11/19.
//  Copyright © 2019 ramachandra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            setUpElements()
        }
        
        func setUpElements() {
             // Hide the error label
            errorLabel.alpha = 0

            
            // Style the elements
            Utilities.styletextField(_textfield: firstNameTextField)
            Utilities.styletextField(_textfield: lastNameTextField)
            Utilities.styleHelloButton(_button: loginBtn)
        }

    @IBAction func loginBtn(_ sender: Any) {
        
    }
        
}
