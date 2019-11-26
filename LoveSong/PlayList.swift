//
//  PlayList.swift
//  LoveSong
//
//  Created by User20 on 2019/11/25.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct PlayList: View {
    @ObservedObject var songsData = SongsData()
    var body: some View {
        NavigationView{
            List{
                ForEach(songsData.songs){ (song) in
                    if song.favorite == true {
                        NavigationLink(destination: SongMusic(song:song)){
                            SongRow(song: song)
                        }                        
                    }
                }
            }
            .navigationBarTitle("我的最愛")
        }
        
        
    }
}

struct PlayList_Previews: PreviewProvider {
    static var previews: some View {
        PlayList()
    }
}
