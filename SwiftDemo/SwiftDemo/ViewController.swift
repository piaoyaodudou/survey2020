//
//  ViewController.swift
//  00.SwiftDemo
//
//  Created by moxiaoyan on 2020/8/21.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit
let cellIndentifier: String = "MOCell"
let insets = UIApplication.shared.delegate?.window??.safeAreaInsets ?? UIEdgeInsets.zero

class ViewController: UIViewController {

  var dataSource: MOArrayDataSource?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "SwiftDemo"
    self.setupTableView()
  }
  
  func setupTableView() {
    let items = [MOCellModel(title: "UITableViewStyle", controller: "MOTableViewStyleVC"),
                 MOCellModel(title: "WKWebView与JS交互", controller: "MOWKWebViewController"),
                 MOCellModel(title: "文件分享", controller: "MOShareDocumentVC")]
    
    let cellConfigure: MOCellConfigureClosure = { (cell: UITableViewCell, item: Any) in
      let it: MOCellModel = item as! MOCellModel
      cell.textLabel?.text = it.title
    }
    self.dataSource = MOArrayDataSource(items: items, cellIndentifier: cellIndentifier, cellConfigureClosure: cellConfigure)

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
    tableView.tableFooterView = UIView()
    return tableView
  }()
}


extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let item: MOCellModel = self.dataSource?.itemAtIndexPath(indexPath) as! MOCellModel
    guard let vc = self.classFromString(item.controller) else {
      print("获取控制器失败")
      return
    }
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func classFromString(_ className: String) -> UIViewController? {
    // 项目名称不能包含: 数字 - or 其他一些特殊符号, 否则转换不了
    guard let appName = Bundle.main.infoDictionary!["CFBundleName"] as? String else {
      print("未获取到命名空间")
      return nil
    }
    
    let str = "\(appName).\(className)"
    print(str)

    guard let vcClass = NSClassFromString(str) else {
      print("未获取到对应类")
      return nil
    }
    guard let vcType = vcClass as? UIViewController.Type else {
      print("未转换成控制器类")
      return nil
    }
    let vc = vcType.init()
    return vc
  }
}
