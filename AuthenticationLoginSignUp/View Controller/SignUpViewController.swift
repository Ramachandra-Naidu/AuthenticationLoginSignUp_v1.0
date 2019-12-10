//
//  SignUpViewController.swift
//  AuthenticationLoginSignUp
//
//  Created by ramachandra on 29/11/19.
//  Copyright © 2019 ramachandra. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignUpViewController: UIViewController {

    @IBOutlet weak var firstnameTF: UITextField!
    @IBOutlet weak var lastnameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setUpElements()
        }
        func setUpElements() {
             // Hide the error label
            errorLbl.alpha = 0
            
            // Style the elements
            Utilities.styletextField(_textfield: firstnameTF)
            Utilities.styletextField(_textfield: lastnameTF)
            Utilities.styletextField(_textfield: emailTF)
            Utilities.styletextField(_textfield: passwordTF)
            Utilities.styleHelloButton(_button: signUpBtn)
        }
    // Check the fields and validate correct. if eveything is correct run
    
    func validateFields() -> String? {
        // Check that all fields are filled in
        if firstnameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        // Check if the password is secure
        let cleanedPassword = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(_password: cleanedPassword!) == false {
            // Password isn't secure enough
            return "Please make sure your password is at leasr 8 character. special character and a number"
        }
        return nil
    }

    @IBAction func signUpBtn(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // There something wrong with the fields, show error message
        showError(_message: error!)
        }
        else {
            // Create cleaned version of the data
            let firstName = firstnameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastnameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        // Create the user
            Auth.auth().createUser(withEmail: email!, password: password!) { (result, err) in
                // Check the error
                if  err != nil {
                    // There was an error crating the user
                    self.showError(_message: "Error crating user")
                } else {
                    // User was crated succfully, now store the firstname and last name
                    let db = Firestore.firestore()
                    
                    db.collection("Users").addDocument(data: ["firstName": firstName as Any, "lastName": lastName as Any, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError(_message: "Error saving user data")
                        }
                        
                    }

                }
                // Transition to the home screen
                self.transitionToHome()

            }
        
    }
    }
    func showError(_message: String) {
        errorLbl.text = _message
        errorLbl.alpha = 1
    }
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storybord.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
