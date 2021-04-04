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
    
    @IBOutlet weak private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCell()
        Api.fetchData {
            self.tableView.reloadData()
        }
    }
    
    private func setUpCell() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MyRepositoryListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GitHubData.jsonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = GitHubData.jsonData[indexPath.row].name
        return cell
    }
}

