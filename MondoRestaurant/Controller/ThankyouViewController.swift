//
//  ThankyouViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 28/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class ThankyouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func Done(_ sender: Any) {
        
        performSegue(withIdentifier: "GoToStaff", sender: self)

    }
    
}
