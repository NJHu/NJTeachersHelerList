//
//  NJFAQTableController.swift
//  NJFAQ
//
//  Created by HuXuPeng on 2018/9/8.
//

import UIKit
import NJKit

class NJTeachersHelerListController: NJRefreshTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nj_isBackActionBtnHidden = true
        var contentInset = self.tableView.contentInset
        contentInset.bottom += self.tabBarController?.tabBar.frame.height ?? 0
        self.tableView.contentInset = contentInset
        self.tableView.mj_footer = nil;
        
    }
}
