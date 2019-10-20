//
//  MoodViewController.swift
//  xema
//
//  Created by Artem Tkachuk on 20/10/2019.
//  Copyright © 2019 Xema. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import SwiftyJSON

class MoodViewController : UIViewController {
    
    var mood : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func normal(_ sender: Any) {
        mood = "Normal"
        performSegue(withIdentifier: "toChoosingFood", sender: self)
    }
    
    
    @IBAction func anxious(_ sender: Any) {
        mood = "Anxious"
        performSegue(withIdentifier: "toChoosingFood", sender: self)

    }
    
    @IBAction func Irritable(_ sender: Any) {
        mood = "Irritable"
        performSegue(withIdentifier: "toChoosingFood", sender: self)

    }
    
    @IBAction func Sad(_ sender: Any) {
        mood = "Sad"
        performSegue(withIdentifier: "toChoosingFood", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? FoodViewController
        {
            vc.mood = mood
        }
    }
}
