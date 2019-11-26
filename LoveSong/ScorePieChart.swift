//
//  ScorePieChart.swift
//  LoveSong
//
//  Created by User20 on 2019/11/25.
//  Copyright © 2019 User24. All rights reserved.
//

import SwiftUI

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) ->Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}

struct ScorePieChart: View {
    @ObservedObject var songsData = SongsData()
    var angles: [Angle]
    @State private var selectedChart = "圓餅圖"
    var analyzeChart = ["圓餅圖", "柱狀圖"]
    init (songsData: SongsData)
    {
        var scoreCount: [Double] = [0,0,0,0,0,0]
        var sum: Double = 0
        var scorePercentages: [Double] = [0,0,0,0,0,0]
        var startDegree: Double = 0
        for song in songsData.songs{
            scoreCount[song.score] += 1
            sum += 1
        }
        for i in 0..<6{
            scorePercentages[i] = scoreCount[i] / sum
        }
        angles = [Angle]()
        for scorePercentage in scorePercentages{
            angles.append(.degrees(startDegree))
            startDegree += 360 * scorePercentage
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: $selectedChart, label: Text("請選擇分析圖表"))
                 {
                     ForEach(self.analyzeChart, id: \.self) { (selectedChart) in
                         Text(selectedChart)
                     }
                 }
                 .labelsHidden()
                 .pickerStyle(SegmentedPickerStyle())
                 .padding(.top,20)
                 .navigationBarTitle(Text("分析"))
                if self.selectedChart == "圓餅圖"
                {
                    DrawPieChart(angles: angles)
                }
                else if self.selectedChart == "柱狀圖"
                {
                    DrawPieChart(angles: angles)
                }
            }
        }
    }
}

struct ScorePieChart_Previews: PreviewProvider {
    static var previews: some View {
        ScorePieChart(songsData: SongsData())
    }
}

struct DrawPieChart: View {
    var angles: [Angle]
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Circle().fill(Color.orange)
                    Text("五星")
                    Circle().fill(Color.red)
                    Text("四星")
                    Circle().fill(Color.green)
                    Text("三星")
                }
                HStack{
                    Circle().fill(Color.purple)
                    Text("二星")
                    Circle().fill(Color.blue)
                    Text("一星")
                    Circle().fill(Color.gray)
                    Text("零星")
                }
            }
            .frame(width:350, height: 30)
            .padding(.top,50)
            ZStack{
                PieChart(startAngle:self.angles[5], endAngle: .zero)
                    .fill(Color.orange)
                PieChart(startAngle:self.angles[4], endAngle: self.angles[5])
                    .fill(Color.red)
                PieChart(startAngle:self.angles[3], endAngle: self.angles[4])
                    .fill(Color.green)
                PieChart(startAngle:self.angles[2], endAngle: self.angles[3])
                    .fill(Color.purple)
                PieChart(startAngle:self.angles[1], endAngle: self.angles[2])
                    .fill(Color.blue)
                PieChart(startAngle:self.angles[0], endAngle: self.angles[1])
                    .fill(Color.gray)
            }
        }
    }
}
