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

class MaterialViewController : UIViewController {
    
    var mood : String = ""
    var food : String = ""
    var material : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(mood)
        print(food)
        print(material)
    }
    
    @IBAction func wool(_ sender: Any) {
        material = "Wool"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    @IBAction func polyester(_ sender: Any) {
        material = "Polyester"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    @IBAction func acrylic(_ sender: Any) {
        material = "Acrylic"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    
    @IBAction func nylon(_ sender: Any) {
        material = "Nylon"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    
    @IBAction func Leather(_ sender: Any) {
        material = "Leather"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    @IBAction func Metals(_ sender: Any) {
        material = "Metals"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    @IBAction func fleece(_ sender: Any) {
        material = "Fleece"
        performSegue(withIdentifier: "goToRateFlare", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let vc = segue.destination as? RateFlareViewController
        {
            vc.mood =  mood
            vc.food = food
            vc.material = material
        }
    }
}
