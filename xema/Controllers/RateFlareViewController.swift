//
//  signUpViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper



class RateFlareViewController: UIViewController {
    
    
    let retrievedString: String? = KeychainWrapper.standard.string(forKey: "token")
    
    override func viewDidLoad() {
        if let token: String = KeychainWrapper.standard.string(forKey: "token") {
            print(token)
            super.viewDidLoad()
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
