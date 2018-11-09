//
//  NJFAQTableController.swift
//  NJFAQ
//
//  Created by HuXuPeng on 2018/9/8.
//

import UIKit
import NJKit

class NJTeachersHelerListController: NJRefreshTableViewController {
    
    var intoItem: THItem!
    let helperListViewModel: HelperListViewModel = HelperListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        var contentInset = self.tableView.contentInset
        contentInset.bottom += self.tabBarController?.tabBar.frame.height ?? 0
        self.tableView.contentInset = contentInset
        // 返回按钮的显示
        nj_isBackActionBtnHidden = THPaths.count == 0
    }

    deinit {
        // 移除路径
       let index = THPaths.lastIndex(of: intoItem!)
        if index != nil {
            THPaths.remove(at: index!)
        }
    }
    
    override func loadData(isMore: Bool) {
        helperListViewModel.getPage(item: intoItem) {[weak self] (response, isSucceed) in
            self?.endHeaderFooterRefreshing()
            if isSucceed {
                // 设置标题
                self?.tableView.reloadData()
                self?.navigationItem.title = self?.helperListViewModel.page?.title
                self?.tableView.mj_footer.state = .noMoreData
            }else {
                
            }
        }
    }
}

extension NJTeachersHelerListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helperListViewModel.page?.items.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "UITableViewCell")
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = helperListViewModel.page?.items[indexPath.row].fileName
        cell?.detailTextLabel?.text = helperListViewModel.page?.items[indexPath.row].introduction
        if helperListViewModel.page?.items[indexPath.row].fileType == .folder {
            cell?.imageView?.image = UIImage.nj_image(name: "NJ_bcl_file_type", bundleClass: NJTeachersHelerListController.self)
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return helperListViewModel.page?.items[indexPath.row].cellHeight ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextTeacherPage = NJTeachersHelerListController(tableViewStyle: UITableView.Style.plain)
        nextTeacherPage.intoItem = helperListViewModel.page!.items[indexPath.row]
        THPaths.append(helperListViewModel.page!.items[indexPath.row])
        self.navigationController?.pushViewController(nextTeacherPage, animated: true)
    }
}

