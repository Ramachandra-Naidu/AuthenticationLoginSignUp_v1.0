//
//  Utilities.swift
//  CustomeLoginAndSignUp
//
//  Created by ramachandra on 29/11/19.
//  Copyright © 2019 ramachandra. All rights reserved.
//

import Foundation
import UIKit


class Utilities {
    static func styletextField(_textfield: UITextField) {
        
        // Create the button line
        let buttonLine = CALayer()
        buttonLine.frame = CGRect(x: 0, y: _textfield.frame.height - 2, width: _textfield.frame.width, height: 2)
        buttonLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        _textfield.borderStyle = .none
        
        //Addinf line to the text field
        _textfield.layer.addSublayer(buttonLine)
        
    }
    static func styleFilledButton(_button: UIButton) {
        // Filled rounded cornner style
        _button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        _button.layer.cornerRadius = 25.0
        _button.tintColor = UIColor.white
    }
    static func styleHelloButton(_button: UIButton) {
        
        // Hello rounded cornner style
        _button.layer.borderColor = UIColor.black.cgColor
        _button.layer.borderWidth = 2
        _button.layer.cornerRadius = 25.0
        _button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@","^(?=.*[a-z](?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,})")
        return passwordTest.evaluate(with: _password)
    }
}
