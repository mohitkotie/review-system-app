//
//  ListViewController.swift
//  ReviewLogin
//
//  Created by mohit kotie on 19/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ListViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var myTableView: UITableView!
    // var api_Key:String = ""
   // let api_Key = UserDefaults.standard.string(forKey: "mail_api_key")

    var listNames:[String] = []
    var listId:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        let data: Parameters = ["apikey": UserDefaults.standard.string(forKey: "mail_api_key")!]
        
        Alamofire.request("https://us16.api.mailchimp.com/3.0/lists", method:.get, parameters:data).responseJSON { response in
            
            
            let json = JSON(response.result.value!)
            print(json)
            let itemCount = json["total_items"].intValue
            
            print ("total items are \(itemCount)")
            
            
            let lists = json["lists"].arrayValue
            
            for list in lists {
                self.listNames.append(list["name"].string!)
                self.listId.append(list["id"].string!)
            }
            self.myTableView.reloadData()
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = listNames[indexPath.row]
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sq = UIStoryboard(name: "Main", bundle: nil)
        
       let rvc = sq.instantiateViewController(withIdentifier: "Review") as! ReviewViewController
        
        UserDefaults.standard.set(listId[indexPath.row], forKey: "id")

        self.present(rvc, animated: true, completion: nil)
       // self.navigationController?.pushViewController(rvc, animated: true)
        
        
    }

    @IBAction func ChangeApiKey(_ sender: UIButton) {
        
       UserDefaults.standard.removeObject(forKey: "mail_api_key")
       UserDefaults.standard.synchronize()
        
        let sq = UIStoryboard(name: "Main", bundle: nil)
        let rvc = sq.instantiateViewController(withIdentifier: "Control") as! ViewController
        self.present(rvc, animated: true, completion: nil)

        
    }
    
}
