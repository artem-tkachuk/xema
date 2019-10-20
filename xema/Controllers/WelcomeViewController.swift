//
//  FirstViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 19/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class WelcomeViewController: UIViewController {
    @IBOutlet weak var loginButt: UIButton!
    
    override func viewDidLoad() {
        loginButt.tintColor = .blue
    }
    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
            
        let token: String? = KeychainWrapper.standard.string(forKey: "token")
        if  token != nil {
            performSegue(withIdentifier: "goToPatientProfile", sender: self)
        }
        // Do any additional setup after loading the view.
        //hello
    }
}

