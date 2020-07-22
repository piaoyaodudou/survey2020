//
//  SceneDelegate.swift
//  01.SwiftTest
//
//  Created by mobvoi on 2020/1/9.
//  Copyright © 2020 moxiaoyan. All rights reserved.
//

import UIKit
import SwiftUI



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func minArray(_ numbers: [Int]) -> Int {
    var min = numbers.last!
    for i in numbers.reversed() {
      if i <= min {
        min = i
      } else {
        return min
      }
    }
    return min
  }

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    print(minArray([3,4,5,1,2]))

    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    // Create the SwiftUI view that provides the window contents.
    let contentView = ContentView()

    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
//    fileManager()
  }
  
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

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

