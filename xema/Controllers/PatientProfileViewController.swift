//
//  PatientProfileViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Alamofire

class PatientProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let APP_ID = "https://xema-256421.appspot.com"
    
    @IBAction func logoutPressed(_ sender: Any) {
        let url = APP_ID + "/logout"
        
        let token: String? = KeychainWrapper.standard.string(forKey: "token")
        
        let parameters : [String : String] = ["token": token!]
        
        //send a request to log out
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
            (response) in
            if response.result.isSuccess {
                //upon success delete from keychain
                let tokenRemoveSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: "token");
                let patientIDRemoveSuccessful : Bool = KeychainWrapper.standard.removeObject(forKey: "patientID")
                
                //redirect to the entrance screen
                self.performSegue(withIdentifier: "welcomeAfterLogout", sender: self)
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
