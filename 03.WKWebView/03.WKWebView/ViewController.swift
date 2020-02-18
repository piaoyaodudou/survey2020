//
//  ViewController.swift
//  03.WKWebView
//
//  Created by moxiaoyan on 2020/2/5.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    
    let btn = UIButton(type: .custom)
    btn.setTitle("webView", for: .normal)
    btn.setTitleColor(.red, for: .normal)
    btn.addTarget(self, action: #selector(clickWebView), for: .touchUpInside)
    btn.frame = CGRect(x: 50, y: 100, width: 100, height: 50)
    view.addSubview(btn)
    
  }

  @objc func clickWebView() {
   
    guard let url: URL = Bundle.main.url(forResource: "index", withExtension: "html") else { return }
    navigationController?.pushViewController(MOWKWebViewController(url: url), animated: true)


//    navigationController?.pushViewController(MOWKWebViewController(url: "https://www.baidu.com/"), animated: true)
  }

}

