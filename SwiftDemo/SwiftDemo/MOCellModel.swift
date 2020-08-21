//
//  MOCellModel.swift
//  00.SwiftDemo
//
//  Created by moxiaoyan on 2020/8/21.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit

typealias MOCellSelectedClosure = () -> Void

class MOCellModel: NSObject {
  
  var title: String
  var vcName: String?
  var selectedClosure: MOCellSelectedClosure?
  
  init(_ title: String, _ vcName: String) {
    self.title = title
    self.vcName = vcName
  }
  init(_ title: String, _ selectedClosure: @escaping MOCellSelectedClosure) {
    self.title = title
    self.selectedClosure = selectedClosure
  }
}
