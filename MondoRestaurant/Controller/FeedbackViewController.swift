//
//  FeedbackViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 25/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FeedbackViewController: UIViewController {
    
    let Feedback_URL = "http://alinasolution.com/restaurants/api/add_customer.php"
    
    let FeedbackDataModel = RestaurantDataModel()
    
    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var dob: UITextField!
    @IBOutlet var anny: UITextField!
    @IBOutlet var conterVC: UIView!
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var doneBtn: UIBarButtonItem!
    @IBOutlet var barVC: UIToolbar!
    @IBOutlet var NextBtn: UIButton!
    @IBOutlet var warningLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeybord()

        myDatePicker.isHidden = true
        warningLbl.text = ""
        conterVC.isHidden = true
        barVC.isHidden = true
        
    }
    
    @IBAction func donBtn(_ sender: Any) {
        
        conterVC.isHidden = true
        barVC.isHidden = true
        myDatePicker.isHidden = true
        
    }
    
    @IBAction func DobVC(_ sender: Any) {
    
    conterVC.isHidden = false
    barVC.isHidden = false
    myDatePicker.isHidden = false
        
        myDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        dob.text = dateFormatter.string(from: myDatePicker.date)
        self.view.endEditing(true)

    }
    
    @IBAction func AnnVC(_ sender: Any) {
    
    conterVC.isHidden = false
        barVC.isHidden = false
        myDatePicker.isHidden = false
        
        myDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        anny.text = dateFormatter.string(from: myDatePicker.date)
        myDatePicker.endEditing(true)
      
    }

    @IBAction func Next(_ sender: Any) {
        
        let cid = "16"
        let bid = "26"
        
        let fstname = name.text!
        let phn = phone.text!
        let birth = dob.text!
        let annvers = anny.text!
        let mail = email.text!

        let emid = "12"
        let tblmo = "1"
        let custno = "2"
        
        let parms : [String : String] = ["cmp_id" : cid,
                                         "branch_id" : bid,
                                         "name" : fstname,
                                         "mobile_no" : phn,
                                         "birth_date" : birth,
                                         "anniversary" : annvers,
                                         "email" : mail,
                                         "emp_id" : emid,
                                         "table_no" : tblmo,
                                         "customer_id" : custno]
        
        getRestaurantData(url: Feedback_URL, parameters: parms)
      
    }
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                
                print(self.FeedbackDataModel.sta)
                
                if self.FeedbackDataModel.sta == true
                {
                    self.performSegue(withIdentifier: "GoToForthVC", sender: self)
                }else{
                    self.warningLbl.text = "\(self.FeedbackDataModel.msg!)"
                    print(Error.self)
                }
                
                print(respondse)
                
            }
            else{
                print("Error")
                
            }
        }
    }
    
    func updateRestaurantData(json : JSON)  {
        
        FeedbackDataModel.sta = json["status"].boolValue
        FeedbackDataModel.msg = json["message"].stringValue
       
        
    }
}



