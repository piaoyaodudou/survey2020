//
//  Student+CoreDataProperties.swift
//  05.SaveData
//
//  Created by moxiaoyan on 2020/5/25.
//  Copyright © 2020 moxiaohui. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var sex: String?
    @NSManaged public var car: Car?

}
