//
//  File.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation

struct Song: Identifiable{
    var id = UUID()
    var name: String
    var singer: String
    var favorite: Bool
}
