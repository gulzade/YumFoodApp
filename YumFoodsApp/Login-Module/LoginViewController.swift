//
//  LoginViewController.swift
//  YumFoodsApp
//
//  Created by Gülzade Karataş on 15.09.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    @IBOutlet weak var userMailLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func loginButton(_ sender: Any) {
        let email = userMailLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = userPasswordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                //couldn't sign in
                let alert = UIAlertController(title: "Error", message: "Login failed!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
                print("Incorrect login")
            }else{
                let alert = UIAlertController(title: "Successfully", message: "Correct login", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action: UIAlertAction!) in
                    self.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true)
               print("successful login")
            
            }
        }
    }
    
}

