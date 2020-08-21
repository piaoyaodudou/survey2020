//
//  MOCellModel.swift
//  00.SwiftDemo
//
//  Created by moxiaoyan on 2020/8/21.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit

class MOCellModel: NSObject {
  
  var title: String
  var controller: String
  
  init(title: String, controller: String) {
    self.title = title
    self.controller = controller
  }
}
