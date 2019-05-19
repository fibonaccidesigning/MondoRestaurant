//
//  FeedbackSecondViewController.swift
//  MondoRestaurant
//
//  Created by Parth Mandaviya on 25/01/19.
//  Copyright © 2019 Parth Mandaviya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FeedbackSecondViewController: UIViewController {

    let feedbackSexondDataModel = RestaurantDataModel()
    
    let feedbackSexond_URL = "http://alinasolution.com/restaurants/api/add_feedback.php"
    
    var FoodQua : String!
    var ServiceQua : String!
    var DEQua : String!
    
    var redResponse : String!
    
    @IBOutlet var Foodbad: UIImageView!
    @IBOutlet var FoodAverage: UIImageView!
    @IBOutlet var FoodGood: UIImageView!
    @IBOutlet var FoodExcellence: UIImageView!
    
    @IBOutlet var ServiceBed: UIImageView!
    @IBOutlet var ServiceAverage: UIImageView!
    @IBOutlet var ServiceGood: UIImageView!
    @IBOutlet var Service: UIImageView!
    
    @IBOutlet var DEBed: UIImageView!
    @IBOutlet var DEAverage: UIImageView!
    @IBOutlet var DEGood: UIImageView!
    @IBOutlet var DEExcellence: UIImageView!
    
    @IBOutlet var NewsR: UIButton!
    @IBOutlet var SMR: UIButton!
    @IBOutlet var FAR: UIButton!
    @IBOutlet var RR: UIButton!
    @IBOutlet var ORd: UIButton!
    
    @IBOutlet var MessageLbl: UILabel!
    @IBOutlet var FeedbackBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.HideKeybord()
        
        Foodbad.isHidden = true
        FoodAverage.isHidden = true
        FoodGood.isHidden = true
        FoodExcellence.isHidden = true
        
        ServiceBed.isHidden = true
        ServiceAverage.isHidden = true
        ServiceGood.isHidden = true
        Service.isHidden = true
        
        DEBed.isHidden = true
        DEAverage.isHidden = true
        DEGood.isHidden = true
        DEExcellence.isHidden = true
       
        MessageLbl.text = ""
        
      
    }
    
   
    
    //MARK: Food
    
    @IBAction func FoodB(_ sender: Any) {
        Foodbad.isHidden = false
        FoodAverage.isHidden = true
        FoodGood.isHidden = true
        FoodExcellence.isHidden = true
        
        FoodQua = "Bed"
    }
    @IBAction func FoodA(_ sender: Any) {
        Foodbad.isHidden = true
        FoodAverage.isHidden = false
        FoodGood.isHidden = true
        FoodExcellence.isHidden = true
        
        FoodQua = "Average"
    }
    
    @IBAction func FoodG(_ sender: Any) {
        Foodbad.isHidden = true
        FoodAverage.isHidden = true
        FoodGood.isHidden = false
        FoodExcellence.isHidden = true
        
        FoodQua = "Good"
    }
    
    @IBAction func FoodE(_ sender: Any) {
        Foodbad.isHidden = true
        FoodAverage.isHidden = true
        FoodGood.isHidden = true
        FoodExcellence.isHidden = false
        
        FoodQua = "Excellence"
    }
    
    //MARK: Service
    
    @IBAction func ServiceB(_ sender: Any) {
        ServiceBed.isHidden = false
        ServiceAverage.isHidden = true
        ServiceGood.isHidden = true
        Service.isHidden = true
        
        ServiceQua = "Bed"
    }
    @IBAction func ServiceA(_ sender: Any) {
        ServiceBed.isHidden = true
        ServiceAverage.isHidden = false
        ServiceGood.isHidden = true
        Service.isHidden = true
        
        ServiceQua = "Average"
    }
    @IBAction func ServiceG(_ sender: Any) {
        ServiceBed.isHidden = true
        ServiceAverage.isHidden = true
        ServiceGood.isHidden = false
        Service.isHidden = true
        
        ServiceQua = "Good"
    }
    @IBAction func ServiceE(_ sender: Any) {
        ServiceBed.isHidden = true
        ServiceAverage.isHidden = true
        ServiceGood.isHidden = true
        Service.isHidden = false
        
        ServiceQua = "Excellence"
    }
    
    
    //MARK: Dining Experience
    
    @IBAction func DEB(_ sender: Any) {
        DEBed.isHidden = false
        DEAverage.isHidden = true
        DEGood.isHidden = true
        DEExcellence.isHidden = true
        
        DEQua = "Bed"
    }
    
    @IBAction func DEA(_ sender: Any) {
        DEBed.isHidden = true
        DEAverage.isHidden = false
        DEGood.isHidden = true
        DEExcellence.isHidden = true
        
        DEQua = "Average"
    }
    
    @IBAction func DEG(_ sender: Any) {
        DEBed.isHidden = true
        DEAverage.isHidden = true
        DEGood.isHidden = false
        DEExcellence.isHidden = true
        
        DEQua = "Good"
    }
    
    @IBAction func DEE(_ sender: Any) {
        DEBed.isHidden = true
        DEAverage.isHidden = true
        DEGood.isHidden = true
        DEExcellence.isHidden = false
        
        DEQua = "Excellence"
    }
    

    //MARK: RedioButton
    
    @IBAction func nRed(_ sender: UIButton) {
        if SMR.isSelected || FAR.isSelected || RR.isSelected || ORd.isSelected{
            SMR.isSelected = false
            FAR.isSelected = false
            RR.isSelected = false
            ORd.isSelected = false
            
            NewsR.isSelected = true
        }else{
            NewsR.isSelected = true
        }
        redResponse = "Newspaper"
        print(redResponse)
    }
    @IBAction func smRed(_ sender: UIButton) {
        if NewsR.isSelected || FAR.isSelected || RR.isSelected || ORd.isSelected{
            NewsR.isSelected = false
            FAR.isSelected = false
            RR.isSelected = false
            ORd.isSelected = false
            
            SMR.isSelected = true
        }else{
            SMR.isSelected = true
        }
        redResponse = "Social Media"
        print(redResponse)
    }
    @IBAction func fRed(_ sender: UIButton) {
        if RR.isSelected || NewsR.isSelected || SMR.isSelected || ORd.isSelected{
            RR.isSelected = false
            NewsR.isSelected = false
            SMR.isSelected = false
            ORd.isSelected = false
            
            FAR.isSelected = true
        }else{
            FAR.isSelected = true
        }
        redResponse = "Food App"
        print(redResponse)
    }
    @IBAction func rRed(_ sender: UIButton) {
        if SMR.isSelected || FAR.isSelected || NewsR.isSelected || ORd.isSelected{
            SMR.isSelected = false
            FAR.isSelected = false
            RR.isSelected = false
            ORd.isSelected = false
            
            RR.isSelected = true
        }else{
            RR.isSelected = true
        }
        redResponse = "Referreed by"
        print(redResponse)
    }
    @IBAction func oRed(_ sender: UIButton) {
        if SMR.isSelected || FAR.isSelected || RR.isSelected || NewsR.isSelected{
            SMR.isSelected = false
            FAR.isSelected = false
            RR.isSelected = false
            ORd.isSelected = false
            
            ORd.isSelected = true
        }else{
            ORd.isSelected = true
        }
        redResponse = "Others"
        print(redResponse)
    }
    
    //MARK: Json GetData
    
    func getRestaurantData(url : String, parameters: [String : String]) {
        
        Alamofire.request(url, method: .post, parameters : parameters).responseJSON {
            respondse in
            if respondse.result.isSuccess {
                
                let RestaurantJSON : JSON = JSON(respondse.result.value!)
                self.updateRestaurantData(json: RestaurantJSON)
                print(respondse)
                
                if self.feedbackSexondDataModel.sta == true
                {
                    self.performSegue(withIdentifier: "GoToFifthVC", sender: self)
                }else{
                    self.MessageLbl.text = "\(self.feedbackSexondDataModel.msg!)"
                }
            }
            else{
                
                print("Error")
                
            }
        }
    }
    
    //MARK: Json UpdateData
    
    func updateRestaurantData(json : JSON)  {
        
        feedbackSexondDataModel.sta = json["status"].boolValue
        feedbackSexondDataModel.msg = json["message"].stringValue
        
    }
    
    //MARK: SubmitData
    
    @IBAction func SubmitBtn(_ sender: Any) {
        
        let cusid = "1"
        let emplid = "1"
        let cid = "16"
        let bid = "26"
        
        let foodq = FoodQua!
        let serq = ServiceQua!
        let diexpe = DEQua!
        
        let cuskno = redResponse!
        let oth = "other"
        
        let feed = FeedbackBox.text!
        
        let px = "12"
        let tblmo = "12"
        
        let parms : [String : String] = ["customer_id" : cusid,
                                         "empid" : emplid,
                                         "cmp_id" : cid,
                                         "branch_id" : bid,
                                         "food" : foodq,
                                         "services" : serq,
                                         "dining_experience" : diexpe,
                                         "cometo_know" : cuskno,
                                         "other" : oth,
                                         "feedback" : feed,
                                         "pax" : px,
                                         "emp_id" : tblmo]
        
        getRestaurantData(url: feedbackSexond_URL, parameters: parms)
        
       
    }
    
    
}
