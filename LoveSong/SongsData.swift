//
//  SongsData.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation

class SongsData: ObservableObject {
    @Published var songs = [Song]()
    var number = 0
}
