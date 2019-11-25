//
//  File.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation

struct Song: Identifiable, Codable{
    var id = UUID()
    var name: String
    var singer: String
    var score: Int
    var favorite: Bool
}
