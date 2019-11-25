//
//  SongsData.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation

class SongsData: ObservableObject {
    @Published var songs = [Song]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(songs) {
                UserDefaults.standard.set(data, forKey: "songs")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey:"songs") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Song].self, from: data) {
                songs = decodedData
            }
        }
    }
}
