//
//  Api.swift
//  githubApp
//
//  Created by 徳永勇希 on 2021/04/04.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api {
    static func fetchData(success: @escaping () -> Void) {
        let url = "https://api.github.com/users/yuuki-job/repos"
        
        AF.request(url, method: .get, parameters: nil).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for data in json.arrayValue {
                    let jsonData = GitHubData(json: data)
                    GitHubData.jsonData.append(jsonData)
                }
                DispatchQueue.main.async {
                    success()
                }
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
}
