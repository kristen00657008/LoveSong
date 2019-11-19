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
            Image(systemName: "music.note")
                .resizable()
                .scaledToFill()
                .padding(.leading, 10)
                .background(Color.gray)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack{
                Text(song.name)
                    .font(Font.system(size: 25))
                    .padding(.leading, 10)
                Text(song.singer)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
            
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song: Song(id: UUID(), name: "", singer: "", favorite: false))
    }
}

