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
import SwiftKeychainWrapper

class SignUpViewController: UIViewController {
    
    let APP_ID = "https://xema-256421.appspot.com"
    
    let userDataModel = UserDataModel()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func SignUp(_ sender: UIButton) {
        
        if password != repeatPassword {
            //stay on same screen and display the message saying passwords do not match
        }
        
        let params: [String: String] = ["firstName": firstName.text!, "lastName": lastName.text!, "username": username.text!, "email": email.text!, "password": password.text!]
        
        postSignUp(parameters: params)
    }
    
    func postSignUp(parameters : [String: String]) {
        let url = APP_ID + "/add-patient"       //replace with app engine id ==> domain name
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success! The user is created!")  //debugging
                let data : JSON = JSON(response.result.value!)
                //look for this method inside the current class
                //self.updateUserDataModel(json: tokenJSON)
                print(data)
                
                if let token = data["token"].string, let patientID = data["patientID"].string {
                    let savePatientID : Bool = KeychainWrapper.standard.set(patientID, forKey: "patientID")
                    let saveToken: Bool = KeychainWrapper.standard.set(token, forKey: "token")
                    
                    print(savePatientID)
                    print(saveToken)
                    
                    self.performSegue(withIdentifier: "goToFlareUp", sender: self)
                }
                
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

