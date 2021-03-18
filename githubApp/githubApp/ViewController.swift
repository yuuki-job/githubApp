//
//  ViewController.swift
//  githubApp
//
//  Created by 徳永勇希 on 2021/03/18.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCell()
        fetchData()
        
    }
    func setUpCell() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    func fetchData() {
        let url = "https://api.github.com/users/yuuki-job/repos"
        
        AF.request(url, method: .get, parameters: nil).responseJSON { (response) in
            
            switch response.result{
            
            case .success(_):
                let json = try? JSON(data: response.data!)
                print(json)
        
            case .failure(_):
                print("error")
            }
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
}

