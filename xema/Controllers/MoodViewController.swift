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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var Moods: [UIButton]!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print(Moods ?? "Null")
        if segue.destination is FoodViewController
        {
            if let vc = segue.destination as? FoodViewController
            {
                vc.Moods = Moods
                performSegue(withIdentifier: "toChoosingFood", sender: self)
            }
        }
    }
}
