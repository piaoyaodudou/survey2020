//
//  MOArrayDataSource.swift
//  00.SwiftDemo
//
//  Created by moxiaoyan on 2020/8/21.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit

typealias MOCellConfigureClosure = (_ cell: UITableViewCell,_ item: Any) -> Void

class MOArrayDataSource: NSObject, UITableViewDataSource {
  
  var items: Array<Any>
  var cellIndentifer: String
  var cellConfigureClosure: MOCellConfigureClosure
  
  init(items: Array<Any>, cellIndentifier: String, cellConfigureClosure: @escaping MOCellConfigureClosure) {
    self.items = items
    self.cellIndentifer = cellIndentifier
    self.cellConfigureClosure = cellConfigureClosure
  }
  
  func itemAtIndexPath(_ indexPath: IndexPath) -> Any {
    return self.items[indexPath.row]
  }
  
  // MARK: - UITableViewDataSource
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIndentifer, for: indexPath)
    let item = self.itemAtIndexPath(indexPath)
    self.cellConfigureClosure(cell, item)
    return cell
  }
  
}
