//
//  THPageData.swift
//  NJTeachersHelerList
//
//  Created by HuXuPeng on 2018/10/27.
//

import UIKit
import SwiftyJSON

class THPage: NSObject {
    var error: Int
    var errorMsg: String
    var title: String
    var currentPageUrl: String
    var jsonData: JSON
    var items: [THItem]
    
    init(jsonData: JSON) {
        self.jsonData = jsonData
        error = jsonData["error"].intValue
        errorMsg = jsonData["errorMsg"].stringValue
        title = jsonData["title"].stringValue
        
        var items: [THItem] = [THItem]()
        for (index, jsonValue) in jsonData["data"].arrayValue.enumerated() {
            items.append(THItem(jsonData: jsonValue))
        }
        self.items = items
        
        
        //        kBCLShoolBaseUrl
        //        kPageConfig
        //        THPaths
        
        var middlePath = "/"
        for path in THPaths {
            middlePath += (path.fileName + "/")
        }
        currentPageUrl = (kBCLShoolBaseUrl + middlePath + kPageConfig).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
}
