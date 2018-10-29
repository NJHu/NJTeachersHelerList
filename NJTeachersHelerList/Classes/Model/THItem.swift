//
//  THItem.swift
//  NJTeachersHelerList
//
//  Created by HuXuPeng on 2018/10/27.
//

import UIKit
import SwiftyJSON

class THItem: NSObject {
    var fileName: String
    var fileType: String
    var videoLength: String
    var videoTime: String
    var author: String
    var introduction: String
    // 扩展
    var jsonData: JSON
    var cellHeight: CGFloat = 50
    
    // MARK:- 扩展
    var nextPageUrl: String!
    
    init(jsonData: JSON) {
        self.jsonData = jsonData
        fileName = jsonData["fileName"].stringValue
        fileType = jsonData["fileType"].stringValue
        videoLength = jsonData["videoLength"].stringValue
        videoTime = jsonData["videoTime"].stringValue
        author = jsonData["author"].stringValue
        introduction = jsonData["introduction"].stringValue
        
        //        kBCLShoolBaseUrl
        //        kPageConfig
        //        THPaths
        if fileType == "folder" {
            var middlePath = "/"
            for path in THPaths {
                middlePath += (path.fileName + "/")
            }
            nextPageUrl = (kBCLShoolBaseUrl + middlePath + fileName + "/" +  kPageConfig).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            
            print(nextPageUrl)
            
        }else if fileType == "video" {
            cellHeight = 100
        }
    }
    override convenience init() {
        self.init(jsonData: JSON.init(parseJSON: "{\"fileType\": \"folder\", \"fileName\": \"\"}"))
    }
}
