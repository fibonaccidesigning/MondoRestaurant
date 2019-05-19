//
//  mypicViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 29/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit

class mypicViewController: UIViewController {
    
    
   
    @IBOutlet var myPickerVC: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
     
        
    }
    
    @IBAction func done(_ sender: Any) {
        
        myPickerVC.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: myPickerVC.date)
        print("selectedDate",selectedDate)
        
    }
   
}
