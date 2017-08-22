//
//  ReviewViewController.swift
//  ReviewLogin
//
//  Created by mohit kotie on 19/06/17.
//  Copyright © 2017 mohit kotie mohit. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    
    @IBOutlet weak var ReviewViewTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReviewViewTable.dataSource = self
        ReviewViewTable.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ReviewViewTable.dequeueReusableCell(withIdentifier: "Cell1")
        
        cell?.textLabel?.text = "\( indexPath.row + 1) star"
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sq = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = sq.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        
        //self.navigationController?.pushViewController(dvc, animated: true)
        self.present(dvc, animated: true, completion: nil)

        
    }

   

}
