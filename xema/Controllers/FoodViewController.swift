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

class FoodViewController : UIViewController {
    
    var mood : String = ""
    var food : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mood)
        print(food)
    }
  
    
    
    
    @IBAction func nuts(_ sender: Any) {
        food = "Nuts"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func dairy(_ sender: Any) {
        food = "Dairy"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func egg(_ sender: Any) {
        food = "Egg"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func soy(_ sender: Any) {
        food = "Soy"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func shellfish(_ sender: Any) {
        food = "Shellfish"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func chocolate(_ sender: Any) {
        food = "Chocolate"
        performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
    
    @IBAction func wheat(_ sender: Any) {
        food = "Wheat"
         performSegue(withIdentifier: "goToChoosingMaterials", sender: self)
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? MaterialViewController
        {
            vc.mood = mood
            vc.food = food
        }
    }
}
