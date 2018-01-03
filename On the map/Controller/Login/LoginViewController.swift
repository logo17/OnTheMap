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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func login(_ sender: Any) {
        let errorMessage = checkFields()
        if errorMessage.isEmpty {
            showActivityIndicator()
            UdacityClient.sharedInstance().login(username: emailTextField.text ?? "", password: passwordTextField.text ?? ""){ [weak self] (response, error) in
                if let response = response {
                    UdacityUserInformation.sharedInstance().sessionId = response.sessionID
                    UdacityUserInformation.sharedInstance().userId = response.userID
                    self?.retrieveUserInformation(response.userID)
                } else {
                    self?.hideActivityIndicator()
                    self?.showLoginError(error)
                }
                
            }
        } else {
            presentErrorAlertController(title: "Required field", errorMessage: errorMessage, buttonText: "Ok")
        }
    }
    
    //MARK: Private methods
    
    private func retrieveUserInformation(_ userId: String) {
        UdacityClient.sharedInstance().retrieveUserInformation(userId)
        { [weak self] (response, error) in
            self?.hideActivityIndicator()
            if let response = response {
                UdacityUserInformation.sharedInstance().firstName = response.firstName
                UdacityUserInformation.sharedInstance().lastName = response.lastName
                performUIUpdatesOnMain {
                    self?.performSegue(withIdentifier: "showMainMenu", sender: nil)
                }
            } else {
                self?.showLoginError(error)
            }
        }
    }
    
    private func showLoginError(_ error: NSError?) {
        performUIUpdatesOnMain {
            let errorText : String
            if let error = error {
                errorText = error.localizedDescription
            } else {
                errorText = "There was an error trying to log in"
            }
            self.presentErrorAlertController(title: "Error", errorMessage: errorText, buttonText: "Ok")
        }
    }
    
    private func checkFields() -> String {
        var result: String?
        if emailTextField.isTextFieldEmpty() {
            result = "Username required"
        } else if passwordTextField.isTextFieldEmpty() {
            result = "Password required"
        }
        return result ?? ""
    }
    
}

