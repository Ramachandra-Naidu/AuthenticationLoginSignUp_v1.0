//
//  ViewController.swift
//  AuthenticationLoginSignUp
//
//  Created by ramachandra on 29/11/19.
//  Copyright © 2019 ramachandra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var sign: UIButton!
    
    @IBOutlet weak var login: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpElements()
        }
        func setUpElements() {
            // Style the elements
            Utilities.styleHelloButton(_button: sign)
            Utilities.styleHelloButton(_button: login)

    }

    @IBAction func signUpTapped(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? LoginViewController
        vc?.firstNameTextField = self.nameTextField
    }
    
    @IBAction func loginTapped(_ sender: Any) {
//        let name = nameTextField.text
//        performSegue(withIdentifier: "Segue", sender: self)

    }
}

