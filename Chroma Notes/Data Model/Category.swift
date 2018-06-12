//
//  Category.swift
//  Chroma Notes
//
//  Created by Himanshu Soni on 12/06/18.
//  Copyright © 2018 Himanshu Soni. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
