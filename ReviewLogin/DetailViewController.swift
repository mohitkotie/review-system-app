//
//  DetailViewController.swift
//  ReviewLogin
//
//  Created by mohit kotie on 19/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailViewController: UIViewController {

    
    let apiKey = UserDefaults.standard.string(forKey: "mail_api_key")

    let idKey = UserDefaults.standard.string(forKey: "id")

    @IBOutlet weak var FirstNameField: UITextField!
    
    @IBOutlet weak var LastNameField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        
       
        let data: Parameters = [
            "email_address": EmailTextField.text! ,
            "status": "subscribed",
            "merge_fields": [
                "FNAME": FirstNameField.text ,
                "LNAME": LastNameField.text
            ]
            ]

        let headers:HTTPHeaders = ["Authorization": "bearer \(apiKey!)"]
        
        Alamofire.request("https://us16.api.mailchimp.com/3.0/lists/\(idKey!)/members?", method:.post, parameters: data , encoding: JSONEncoding.default , headers: headers).responseJSON{(data) in
            
           print(data.result.value!)
        }
        
        
   let sq = UIStoryboard(name:"Main", bundle: nil)
    
let rvc = sq.instantiateViewController(withIdentifier: "Review") as! ReviewViewController
        // let rvc = sq.instantiateViewController(withIdentifier: "List") as! ListViewController

 self.present(rvc, animated: true, completion: nil)
    

    }
   }
