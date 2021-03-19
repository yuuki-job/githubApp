//
//  GitHubData.swift
//  githubApp
//
//  Created by 徳永勇希 on 2021/03/19.
//

import Foundation
import SwiftyJSON
class GitHubData {
    
    static var jsonData:[GitHubData] = []
    
    var name:String
    
    init(json:JSON) {
        self.name = json["name"].stringValue
        print(name)
    }
}
