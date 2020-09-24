//
//  MOAlgorithm.swift
//  01.SwiftDemo
//
//  Created by moxiaoyan on 2020/9/24.
//  Copyright © 2020 moxiaohui. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func test() {
  let l1 = creatList([5])
  let l2 = creatList([5])
  let res = addTwoNumbers(l1, l2)
  print(res)
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  if l1 == nil {
    return l2
  }
  if l2 == nil {
    return l1
  }
  var l11: ListNode? = l1, l22: ListNode? = l2
  var current: ListNode? = nil // 当前结点
  var res: ListNode? = nil // 需要返回的头结点
  var carry = 0 // 进位
  while l11 != nil || l22 != nil {
    let sum = (l11?.val ?? 0) + (l22?.val ?? 0) + carry
    if sum >= 10 { // 判断有无进位
      carry = sum / 10
    } else {
      carry = 0
    }
    if current == nil { // 头结点
      current = ListNode(sum % 10)
      res = current
    } else { // 创建next结点
      current?.next = ListNode(sum % 10)
      current = current?.next
    }
    l11 = l11?.next ?? nil
    l22 = l22?.next ?? nil
  }
  if carry > 0 { // 最后如果有进位需要加一个next结点
    current?.next = ListNode(carry)
  }
  return res
}

fileprivate func creatList(_ nums: [Int]) -> ListNode? {
  if nums.isEmpty {
    return nil
  }
  var current: ListNode? = nil
  var res: ListNode? = nil
  for value in nums {
    if current == nil {
      current = ListNode(value)
      res = current
    } else {
      current?.next = ListNode(value)
      current = current?.next
    }
  }
  return res
}

