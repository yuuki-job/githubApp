//
//  ViewController.swift
//  githubApp
//
//  Created by 徳永勇希 on 2021/03/18.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyRepositoryListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var githubDatas = GitHubData.jsonData
    
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
            
            case .success(let value):
                let json = JSON(value)
                
                for data in json.arrayValue {
                    let jsonData = GitHubData(json: data)
                    
                    self.githubDatas.append(jsonData)
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
}

extension MyRepositoryListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return githubDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = githubDatas[indexPath.row].name
        return cell
    }
}

