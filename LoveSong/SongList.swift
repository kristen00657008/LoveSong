//
//  ContentView.swift
//  LoveSong
//
//  Created by User24 on 2019/11/18.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct SongList: View {
    @ObservedObject var songsData = SongsData()
    @State private var showEditSong = false
    var body: some View {
        NavigationView{
            List{
                ForEach(songsData.songs){ (song) in
                    NavigationLink(destination: SongEditor(songsData: self.songsData, editSong: song)){
                        SongRow(song: song)
                    }
                }
                .onDelete{ (indexSet) in
                    self.songsData.songs.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("歌曲列表")
            .navigationBarItems(leading:
                HStack{
                    EditButton()
                        .padding(5)
                    
                    Button(action: {
                        self.songsData.songs.removeAll()
                    }, label: {Text("一鍵清除")})
                }
                ,trailing:
                HStack{
                    Button(action: {
                        for song in DemoData
                        {
                            self.songsData.songs.append(song)
                        }                        
                        }, label: {Text("一鍵新增")})
                        .padding(5)
                    
                    Button(action: {self.showEditSong = true}, label: {Image(systemName: "plus.circle.fill")})
                })
            .sheet(isPresented: $showEditSong) {
                NavigationView{
                    SongEditor(songsData: self.songsData)
                }
            }
        }        
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
