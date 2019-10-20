//
//  signUpViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    let APP_ID = "https://xema-256421.appspot.com"
    
    let userDataModel = UserDataModel()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!

    
    @IBAction func login(_ sender: Any) {
        let params: [String: String] = ["email": email.text!, "password": password.text!]
        
        postLogin(parameters: params)
    }
    
    func postLogin(parameters : [String: String]) {
        let url = APP_ID + "/login"       //replace with app engine id ==> domain name
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Loged in!")  //debugging
                let tokenJSON : JSON = JSON(response.result.value!)
                //look for this method inside the current class
                self.updateUserDataModel(json: tokenJSON)
            } else {
                print("Error \(String(describing: response.result.error))")
                //self.cityLabel.text = "Connection issues"
            }
        }
    }
    
    ////                //!!!!! store JWT!!!!
    ////                // pass JWT in each request
    
    func updateUserDataModel(json: JSON) {
        if let token = json["token"].string{
            userDataModel.token = token
            print(userDataModel.token)
            updateUIWIthUserData()  //TODO implement
        } else {
            //auth is denied
        }
    }
    
    
    //MARK: - UI Updates
    /***************************************************************/
    func updateUIWIthUserData() {
        //update fields
    }
    
}

