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

class signUpViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    
    @IBAction func SignUp(_ sender: UIButton) {
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

func postSignUp(url : String, parameters : [String: String]) {
    Alamofire.request(url, method: .post, parameters: parameters).responseJSON {
        if response.result.isSuccess {
            print("Success! A user is successfully signed up!")
            
            let weatherJSON : JSON = JSON(response.result.value!) //force unwrapping
            self.updateWeatherData(json: weatherJSON)             //look for this method inside the current class
            
            //!!!!! store JWT!!!!
            //check for repeatPassword == Password
            
        } else {
            print("Error \(String(describing: response.result.error))")
            self.cityLabel.text = "Connection issues"
        }
    }
}

func getWeatherData(url : String, parameters : [String: String]) {
    Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
        response in
        if response.result.isSuccess {
            print("Success! Got the weather data!")
            
            let weatherJSON : JSON = JSON(response.result.value!) //force unwrapping
            self.updateWeatherData(json: weatherJSON)             //look for this method inside the current class
            
        } else {
            print("Error \(String(describing: response.result.error))")
            self.cityLabel.text = "Connection issues"
        }
    }
}
