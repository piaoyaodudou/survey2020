//
//  ViewController.swift
//  00.SwiftDemo
//
//  Created by moxiaoyan on 2020/8/21.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit
let cellIndentifier: String = "MOCellIndentifier"
let headerIndentifier: String = "MOHeaderIndentifier"
let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero

class ViewController: UIViewController {

  var dataSource: MOArrayDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "SwiftDemo"
    self.setupTableView()
  }
  func setupTableView() {
    let section0 = [MOCellModel("UITableViewStyle", "MOTableViewStyleVC"),
                    MOCellModel("WKWebView与JS交互", "MOWKWebViewController"),
                    MOCellModel("文件分享", "MOShareDocumentVC")]
    let section1 = [MOCellModel("文件操作", { [weak self] in
      self?.fileManager()
    })]
    let sections = [section0, section1]
    
    let cellConfigure: MOCellConfigureClosure = { (cell: UITableViewCell, item: Any) in
      guard let it: MOCellModel = item as? MOCellModel else {
        return
      }
      cell.textLabel?.text = it.title
    }
    self.dataSource = MOArrayDataSource(sections, cellIndentifier, cellConfigure)

    tableView.delegate = self
    tableView.dataSource = self.dataSource
    view.addSubview(tableView)
    tableView.reloadData()
  }
  
  override func viewSafeAreaInsetsDidChange() {
    let insets: UIEdgeInsets = view.safeAreaInsets
    let frame: CGRect = CGRect(x: insets.left, y: insets.top, width: UIScreen.main.bounds.width - insets.left - insets.right, height: UIScreen.main.bounds.height - insets.top - insets.bottom)
    tableView.frame = frame
    tableView.reloadData()
  }
  
  lazy var tableView: UITableView = {
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
    tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerIndentifier)
    tableView.tableHeaderView = UIView()
    tableView.tableFooterView = UIView()
    return tableView
  }()
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item: MOCellModel = self.dataSource?.itemAtIndexPath(indexPath) as! MOCellModel
    
    if indexPath.section == 0 {
      guard let vcName = item.vcName else {
        print("vcName 为空")
        return
      }
      
      guard let vc = self.dataSource?.classFromString(vcName) else {
        print("获取控制器失败")
        return
      }
      navigationController?.pushViewController(vc, animated: true)
    } else {
      if let selected = item.selectedClosure {
        selected()
      }
    }
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIndentifier)
    header?.textLabel?.text = section == 0 ? "跳转" : "执行"
    return header
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 30
  }
}

extension ViewController {
  func fileManager() {
    MOFileManager.shareInstance.creatFolder("moxiaoyan")
  //    MOFileManager.shareInstance.deleteFile("moxiaoyan")

    MOFileManager.shareInstance.createFile("moxiaoyan/test1.txt")
  //    MOFileManager.shareInstance.deleteFile("moxiaoyan/test1.txt")
    MOFileManager.shareInstance.enableFile("moxiaoyan") // /test1.txt
    MOFileManager.shareInstance.readFile("moxiaoyan/test1.txt")
    MOFileManager.shareInstance.copyFile()
    // 写入数据
  //    MOFileManager.shareInstance.write("moxiaoyan/test1.txt", string: "zzz")
    
    // 移动文件
  //    MOFileManager.shareInstance.creatFolder("moxiaohui")
  //    MOFileManager.shareInstance.moveFile("moxiaoyan/test1.txt", to:"moxiaohui")
    
    // 清空文件夹
  //    MOFileManager.shareInstance.clearFolder("moxiaoyan")
    
    // 遍历“moxiaoyan”文件夹：test1.txt、test2.txt、momo文件夹/test3.text
    MOFileManager.shareInstance.creatFolder("moxiaoyan/momo")
    MOFileManager.shareInstance.createFile("moxiaoyan/momo/test3.txt")
    MOFileManager.shareInstance.traversals("moxiaoyan")
    
    // 比较两个路径是否一致
    MOFileManager.shareInstance.equal("moxiaoyan", "moxiaoyan")
    
    // https://www.jianshu.com/p/8feb8b0df1d0
  }
}
