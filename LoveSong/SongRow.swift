//
//  SongRow.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct SongRow: View {
    var song: Song
    var body: some View {
        HStack{
            //Image(song.name)
            VStack{
                Text(song.name)
                Text(song.singer)
            }
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(id: UUID(), name: "", singer: "", favorite: false))
    }
}
