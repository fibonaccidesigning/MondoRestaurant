//
//  ViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 23/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension UIViewController {
    
    func HideKeybord() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {

     let Restauran_URL = "http://alinasolution.com/restaurants/api/login.php"
    
     let restaurantDataModel = RestaurantDataModel()
    
    @IBOutlet var UsernameTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    @IBOutlet var MessageLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        MessageLbl.text = ""
        
        UsernameTextField.delegate = self
        PasswordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        UsernameTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
        return true
    }
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                
                print(self.restaurantDataModel.sta)
              
                
                if self.restaurantDataModel.sta == true
                {
                    self.performSegue(withIdentifier: "GoToSecondVC", sender: self)
                    
                }
                else{
                    self.MessageLbl.text = "\(self.restaurantDataModel.msg!)"
                }
                
                print(respondse)
                
            }
            else{
                
                print("Error")
                
                
            }
        }
    }
    


    @IBAction func LoginBtn(_ sender: Any) {
        
        let username = UsernameTextField.text!
        let password = PasswordTextField.text!
        let id = "16"
        
        let parms : [String : String] = ["user_name" : username,
                                         "password" : password,
                                         "cmp_id" : id]
        
        getRestaurantData(url: Restauran_URL, parameters: parms)
        
    }
    
    func updateRestaurantData(json : JSON)  {
        
        restaurantDataModel.sta = json["status"].boolValue
        restaurantDataModel.msg = json["message"].stringValue
    
    }
    
}
