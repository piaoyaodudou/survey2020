//
//  ViewController.swift
//  06.ShareDocument
//
//  Created by moxiaoyan on 2020/5/27.
//  Copyright © 2020 moxiaohui. All rights reserved.
//
// https://www.jianshu.com/p/eb4046478ed6
// https://www.jianshu.com/p/978d38533c5c

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()


    let manager = FileManager.default
    let urlForDocument = manager.urls(for: .documentDirectory, in: .userDomainMask)
    var documentUrl = urlForDocument[0] as URL
    documentUrl.appendPathComponent("Inbox", isDirectory: true)
    do {
      let contentsOfPath = try manager.contentsOfDirectory(at: documentUrl,
                                                           includingPropertiesForKeys: nil,
                                                           options: .skipsHiddenFiles)
      print("contentsOfPath:\n\(contentsOfPath)")
    } catch {
      print("error:\(error)")
    }
    

  }


}

/*
 
 <key>CFBundleDocumentTypes</key>
 <array>
   <dict>
     <key>CFBundleTypeName</key>
     <string>OFFICE Document</string>
     <key>LSHandlerRank</key>
     <string>Owner</string>
     <key>LSItemContentTypes</key>
     <array>
       <string>com.adobe.pdf</string>
     </array>
   </dict>
   <dict>
     <key>CFBundleTypeName</key>
     <string>Binary</string>
     <key>LSHandlerRank</key>
     <string>Alternate</string>
     <key>LSItemContentTypes</key>
     <array>
       <string>public.data</string>
       <string>public.executable</string>
       <string>com.apple.mach-o-binary</string>
       <string>com.apple.pef-binary</string>
     </array>
   </dict>
 
 */

