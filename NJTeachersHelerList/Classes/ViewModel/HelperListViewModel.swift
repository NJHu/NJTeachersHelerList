//
//  HelperListViewModel.swift
//  NJTeachersHelerList
//
//  Created by HuXuPeng on 2018/10/27.
//

import UIKit
import NJKit
import SwiftyJSON

class HelperListViewModel: NSObject {
    var page: THPage?
    func getPage(item: THItem, completion: @escaping (_ response: NJResponse?,_ hasMore: Bool) -> ()) -> Void {
        
        let url = item.nextPageUrl
        if url == nil {
            
            let response = NJResponse()
            response.errorMsg = "数据错误"
            response.statusCode = -1000
            completion(response, false);
            return
        }
        
        NJNetworkTool.sharedTool.GET(url!, parameters: nil) {[weak self] (response: NJResponse) in
            
            guard response.error == nil && response.responseObject != nil && self != nil else {
                completion(response, false)
                return
            }
            
            let jsonData = JSON.init(response.responseObject)
            self?.page = THPage(jsonData: jsonData)
            completion(nil, true)
        }
    }
}
