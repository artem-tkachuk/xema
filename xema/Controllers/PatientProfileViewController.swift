//
//  PatientProfileViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import SwiftyJSON
import Alamofire
import FSCalendar

class PatientProfileViewController: UIViewController {
    
    var data : JSON = [:]
    
    @IBOutlet weak var Severity: UILabel!
    @IBOutlet weak var calendar: FSCalendar!
    
    
    
    let APP_ID = "https://xema-256421.appspot.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        Severity.text = data["data"].string
        //conditionally display events based on the chosen calendar day
        // Do any additional setup after loading the view.
    }
    
 
    
    
    /// Setup without selectable date range
    
    
    
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
