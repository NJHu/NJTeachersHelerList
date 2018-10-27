//
//  Target_NJFAQ.swift
//  Pods
//
//  Created by HuXuPeng on 2018/9/8.
//

import UIKit
import NJKit

@objc class Target_NJTeachersHelerList: NSObject {
    
    @objc func Action_NJTeachersHelerList(params: [String: AnyObject]) -> UIViewController? {
        
        let childController = NJTeachersHelerListController(tableViewStyle: UITableView.Style.plain)
        let nav = NJNavigationController(rootViewController: childController)
        
        childController.tabBarItem.image = UIImage.nj_image(name: "icon_40", bundleClass: Target_NJTeachersHelerList.self)
        childController.tabBarItem.selectedImage = UIImage.nj_image(name: "icon_40", bundleClass: Target_NJTeachersHelerList.self)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        childController.tabBarItem.title = "课程"
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        
        return nav
    }
    
}
