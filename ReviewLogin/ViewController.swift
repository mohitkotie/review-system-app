//
//  ViewController.swift
//  ReviewLogin
//
//  Created by mohit kotie on 19/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ApiKeyField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiKey = UserDefaults.standard.string(forKey: "mail_api_key")
        
        if let key = apiKey {
            ApiKeyField.text = key
        } else {
            print("api key not stored")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func SaveApiKey(_ sender: UIButton) {
        UserDefaults.standard.set(ApiKeyField.text!, forKey: "mail_api_key")
        let sq = UIStoryboard(name: "Main", bundle: nil)
        
        let lvc = sq.instantiateViewController(withIdentifier: "List") as! ListViewController
     // lvc.api_Key = ApiKeyField.text!
      //  self.navigationController?.pushViewController(lvc, animated: true)
        self.present(lvc, animated: true, completion: nil)

    }
}

