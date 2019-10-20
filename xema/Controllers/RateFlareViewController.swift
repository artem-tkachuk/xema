//
//  signUpViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON


class RateFlareViewController: UIViewController {
    
    var mood : String = ""
    var food : String = ""
    var material : String = ""
    var severity : String = ""
    
    //methods
    
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

    @IBAction func mild(_ sender: Any) {
        severity = "Mild"
        if let token: String = KeychainWrapper.standard.string(forKey: "token") {
            print(token)

            let APP_ID = "https://xema-256421.appspot.com"
            let url = APP_ID + "/add-data"


            //put chosen items here
            let parameters : [String : String] = ["token": token, "severity": severity, "food": food, "material": material, "mood": mood]

            Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
                (response) in

                if response.result.isSuccess {
                    print("Success! The data is logged!")  //debugging
                    let data : JSON = JSON(response.result.value!)
                    print(data)
                    self.performSegue(withIdentifier: "goToProfileScreen", sender: self)
                } else {
                    print("Error \(String(describing: response.result.error))")
                    //self.cityLabel.text = "Connection issues"
                }
            }
        }
    }
    
    
    @IBAction func moderate(_ sender: Any) {
        severity = "Moderate"
        if let token: String = KeychainWrapper.standard.string(forKey: "token") {
            print(token)
            
            let APP_ID = "https://xema-256421.appspot.com"
            let url = APP_ID + "/add-data"
            
            
            //put chosen items here
            let parameters : [String : String] = ["token": token, "severity": severity, "food": food, "material": material, "mood": mood]
            
            Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
                (response) in
                
                if response.result.isSuccess {
                    print("Success! The data is logged!")  //debugging
                    let data : JSON = JSON(response.result.value!)
                    print(data)
                    self.performSegue(withIdentifier: "goToProfileScreen", sender: self)
                } else {
                    print("Error \(String(describing: response.result.error))")
                    //self.cityLabel.text = "Connection issues"
                }
            }
        }
    }
    
    
    @IBAction func severe(_ sender: Any) {
        severity = "Severe"
        if let token: String = KeychainWrapper.standard.string(forKey: "token") {
            print(token)
            
            let APP_ID = "https://xema-256421.appspot.com"
            let url = APP_ID + "/add-data"
            
            
            //put chosen items here
            let parameters : [String : String] = ["token": token, "severity": severity, "food": food, "material": material, "mood": mood]
            
            Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
                (response) in
                
                if response.result.isSuccess {
                    print("Success! The data is logged!")  //debugging
                    let data : JSON = JSON(response.result.value!)
                    print(data)
                    self.performSegue(withIdentifier: "goToProfileScreen", sender: self)
                } else {
                    print("Error \(String(describing: response.result.error))")
                    //self.cityLabel.text = "Connection issues"
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PatientProfileViewController
        {
            if let token: String = KeychainWrapper.standard.string(forKey: "token") {
                print(token)

                let APP_ID = "https://xema-256421.appspot.com"
                let url = APP_ID + "/get-data"


                //put chosen items here
                let parameters : [String : String] = ["token": token]

                Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
                    (response) in

                    if response.result.isSuccess {
                        print("Success! That's the data!")  //debugging
                        let data : JSON = JSON(response.result.value!)
                        print(data)
                        vc.data = data
                    } else {
                        print("Error \(String(describing: response.result.error))")
                        //self.cityLabel.text = "Connection issues"
                    }
                }
            }
        }
    }
}
