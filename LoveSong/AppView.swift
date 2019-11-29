//
//  TabView.swift
//  LoveSong
//
//  Created by User20 on 2019/11/25.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var songsData = SongsData()
    var body: some View {
        TabView{
            SongList(songsData: self.songsData).tabItem{
                Image(systemName: "music.house.fill")
                Text("歌曲列表")
            }
            PlayList(songsData: self.songsData).tabItem{
                Image(systemName: "music.note.list")
                Text("播放清單")
            }
            Chart(songsData: self.songsData).tabItem{
                Image(systemName: "chart.pie.fill")
                Text("分析圖表")
            }
        }.accentColor(Color.purple)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
