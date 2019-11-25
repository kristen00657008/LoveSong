//
//  TabView.swift
//  LoveSong
//
//  Created by User20 on 2019/11/25.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct AppView: View {    
    var body: some View {
        TabView{
            SongList().tabItem{
                Image(systemName: "music.house.fill")
                Text("歌曲列表")
            }
            PlayList().tabItem{
                Image(systemName: "music.note.list")
                Text("播放清單")
            }
            ScorePieChart(scoreDataPersentages: [10,20,10,20,15,25]).tabItem{
                Image(systemName: "chart.pie.fill")
                Text("圓餅圖")
            }
        }.accentColor(Color.purple)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
