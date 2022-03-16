//
//  ViewController.swift
//  RetirementCalc
//
//  Created by Raghavendra Kulal on 03/03/22.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics
import Firebase
import FirebaseAuthUI
import FirebaseEmailAuthUI
import FirebaseAuthUI
import FirebaseFacebookAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI
import FirebasePhoneAuthUI

/* ... */



class ViewController: UIViewController,FUIAuthDelegate {
    var email = ""
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var emailout: UITextField!

    @IBAction func email(_ sender: UIButton) {
        
    }
    
    let providers: [FUIAuthProvider] = [
//      FUIGoogleAuth(),
//      FUIFacebookAuth(),
      FUIPhoneAuth(authUI:FUIAuth.defaultAuthUI()!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.trackEvent("App launched")
        // Do any additional setup after loading the view.
    }

    func signUp() {
        let email = emailout.text ?? ""
        let password = pass.text ?? ""
        
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          if let error = error as? NSError {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed: break
              // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
            case .emailAlreadyInUse: break
              // Error: The email address is already in use by another account.
            case .invalidEmail: break
              // Error: The email address is badly formatted.
            case .weakPassword: break
              // Error: The password must be 6 characters long or more.
            default:
                print("Error: \(error.localizedDescription)")
            }
          } else {
            print("User signs up successfully")
            let newUserInfo = Auth.auth().currentUser
            let email = newUserInfo?.email
          }
        }
    }
    
    func signIn() {
        let email = emailout.text ?? ""
        let password = pass.text ?? ""
//        let email = "ragh123@mailinator.com"
//        let password = "12345678"
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error as NSError? {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed: break
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
            case .userDisabled: break
              // Error: The user account has been disabled by an administrator.
            case .wrongPassword:
                let errorLabel = UILabel()
                errorLabel.text = error.localizedDescription
                errorLabel.numberOfLines = 0
                errorLabel.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(errorLabel)
                
                errorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
                errorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
                errorLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                errorLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 30).isActive = true
                
              // Error: The password is invalid or the user does not have a password.
            case .invalidEmail: break
              // Error: Indicates the email address is malformed.
            default:
                print("Error: \(error.localizedDescription)")
            }
          } else {
            print("User signs in successfully")
              let vc = self.storyboard?.instantiateViewController(withIdentifier: "second")
              self.present(vc!, animated: false, completion: nil)
            let userInfo = Auth.auth().currentUser
            let email = userInfo?.email
          }
        }
    }
    
    @IBAction func clickButton(_ sender: Any) {
        Analytics.trackEvent("Button clicked")
        print("just feature update")
//        Crashes.generateTestCrash()
        signIn()
    }
    
    
    
}

