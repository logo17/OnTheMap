//
//  LoginViewController.swift
//  On the map
//
//  Created by Heriberto Ureña madrigal on 12/31/17.
//  Copyright © 2017 Heriberto Ureña Madrigal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func login(_ sender: Any) {
        let errorMessage = checkFields()
        if errorMessage.isEmpty {
            loginButton.isEnabled = false
            UdacityClient.sharedInstance().login(username: emailTextField.text ?? "", password: passwordTextField.text ?? ""){ (response, error) in
                performUIUpdatesOnMain {
                    self.loginButton.isEnabled = true
                    if let response = response {
                        //TODO: save user and session ids
                        self.performSegue(withIdentifier: "showMainMenu", sender: nil)
                    } else {
                        let errorText : String
                        if let error = error {
                            errorText = error.localizedDescription
                        } else {
                            errorText = "There was an error trying to log in"
                        }
                        self.presentErrorAlertController(title: "Error", errorMessage: errorText, buttonText: "Ok")
                    }
                }
            }
        } else {
            presentErrorAlertController(title: "Required field", errorMessage: errorMessage, buttonText: "Ok")
        }
    }
    
    //MARK: Private methods
    
    private func checkFields() -> String {
        var result: String?
        if isTextFieldEmpty(textField: emailTextField) {
            result = "Username required"
        } else if isTextFieldEmpty(textField: passwordTextField) {
            result = "Password required"
        }
        return result ?? ""
    }
    
    private func isTextFieldEmpty(textField: UITextField) -> Bool {
        var result = true
        if let text = textField.text {
            result = text.isEmpty
        }
        return result
    }
    
    private func presentErrorAlertController(title: String, errorMessage: String, buttonText: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: buttonText, style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

