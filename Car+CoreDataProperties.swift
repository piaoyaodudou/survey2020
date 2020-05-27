//
//  Car+CoreDataProperties.swift
//  05.SaveData
//
//  Created by moxiaoyan on 2020/5/25.
//  Copyright © 2020 moxiaohui. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?

}
