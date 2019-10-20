//
//  LoginViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
import UIKit
import Alamofire
import Alamofire_Synchronous
import SwiftyJSON
import SwiftKeychainWrapper

class LoginViewController: UIViewController {
    
    let APP_ID = "https://xema-256421.appspot.com"
    
    let userDataModel = UserDataModel()
    
    //Pre-linked IBOutlets
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func loginPressed(_ sender: Any) {
        let url = APP_ID + "/login"       //replace with app engine id ==> domain name
        let parameters : [String : String] = ["email": email.text!, "password": password.text!]
        
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
            (response) in
            if response.result.isSuccess {
                print(response)
                let data : JSON = JSON(response.result.value!)
                //look for this method inside the current class
                //self.updateUserDataModel(json: tokenJSON)
                
                if let token = data["token"].string, let patientID = data["patientID"].string {
                    let savePatientID : Bool = KeychainWrapper.standard.set(patientID, forKey: "patientID")
                    let saveToken: Bool = KeychainWrapper.standard.set(token, forKey: "token")
                    
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

