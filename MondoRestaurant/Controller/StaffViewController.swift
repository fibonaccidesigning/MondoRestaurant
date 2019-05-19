//
//  StaffViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 23/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//
//ViewDidload


import UIKit
import Alamofire
import SwiftyJSON

class StaffViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var selectedItem = ""
    
    @IBOutlet var myLbl: UILabel!
    @IBOutlet var StaffTextField: UITextField!
    @IBOutlet var TableTextField: UITextField!
    @IBOutlet var PaxTextField: UITextField!
    @IBOutlet var myPickerViewer: UIPickerView!
    @IBOutlet var pickerContainer: UIView!
    @IBOutlet var BarBtn: UIToolbar!
    @IBOutlet var messageLbl: UILabel!
    
    let Restauran_URL = "http://alinasolution.com/restaurants/api/login.php"
    let Employee_URL = "http://alinasolution.com/restaurants/api/select_employee.php"
    
    var arrEmpData = ["1","2","3","4","5","6","7"]
    var arrTableData = ["1","2","3","4","5","6","7"]
    
    let employeeDataModel = RestaurantDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.HideKeybord()
   
        messageLbl.text = ""
        pickerContainer.isHidden = true
        BarBtn.isHidden = true
        myPickerViewer.isHidden = true

    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrTableData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrTableData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedItem = arrTableData[row]
        TableTextField.text = selectedItem
    }
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                print(respondse)
                
                if self.employeeDataModel.sta == true
                {
                    self.performSegue(withIdentifier: "GoToThiredVC", sender: self)
                }else{
                    self.messageLbl.text = "\(self.employeeDataModel.msg!)"
                }
            }
            else{
                
                print("Error")
            
            }
        }
    }
  
    func updateRestaurantData(json : JSON)  {
  
        employeeDataModel.sta = json["status"].boolValue
        employeeDataModel.msg = json["message"].stringValue

    }
    
    @IBAction func NextBtn(_ sender: Any) {
        
        let bid = "26"
        
        let parms : [String : String] = ["branch_id" : bid]
        
        getRestaurantData(url: Employee_URL, parameters: parms)
        
    }
    
    @IBAction func StaffField(_ sender: Any) {
//        pickerContainer.isHidden = false
//        BarBtn.isHidden = false
//        myPickerViewer.isHidden = false
        
    }
    
    @IBAction func TableField(_ sender: Any) {
        pickerContainer.isHidden = false
        BarBtn.isHidden = false
        myPickerViewer.isHidden = false
    }
    
    
    @IBAction func DoneBtn(_ sender: Any) {
        pickerContainer.isHidden = true
        BarBtn.isHidden = true
        myPickerViewer.isHidden = true
    }

}



