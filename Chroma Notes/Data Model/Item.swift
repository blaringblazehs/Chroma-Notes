//
//  Item.swift
//  Chroma Notes
//
//  Created by Himanshu Soni on 12/06/18.
//  Copyright © 2018 Himanshu Soni. All rights reserved.
//

import Foundation
import RealmSwift
class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
