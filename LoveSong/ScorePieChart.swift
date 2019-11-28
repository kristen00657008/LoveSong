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
    var scoreCount: [Double] = [0,0,0,0,0,0]
    @State private var selectedChart = "圓餅圖"
    var analyzeChart = ["圓餅圖", "柱狀圖"]
    init (songsData: SongsData)
    {
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
                 .position(x: 210, y: 50)
                 .navigationBarTitle(Text("分析"))
                if self.selectedChart == "圓餅圖"
                {
                    DrawPieChart(angles: angles).padding(.top,20)
                }
                else if self.selectedChart == "柱狀圖"
                {
                    DrawBarChart(scoreCount: scoreCount)
                }
               
            }
            .padding(.top,20)
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
        .padding(.top,-250)
    }
}

struct DrawBarChart: View {
    var scoreCount: [Double]
    var body: some View {
        HStack
        {
            VStack
            {
                Text("100+")
                    .padding(.top, 4)
            }
            .frame(width: 60, height: 270)
            
            ZStack(alignment: .leading)
            {
                Path
                {
                    (path) in
                    path.move(to: CGPoint(x: 0, y: -290))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 320, y: 0))
                }
                .stroke(Color.black, lineWidth: 2)
                starText()
            }
        }
        .frame(width: 300, height: 270)
        .position(x: 160, y: 250)
    }
}
struct starText: View
{
    var body: some View
    {
        Group
        {
            Text("0").offset(x:1.5, y:-30)
            Text("1")
            Text("2")
            Text("3")
            Text("4")
            Text("5")
            
        }
        .padding()
    }
}

struct starCountText: View
{
    var body: some View
    {
        Group
        {
            Text("0~9 ")
            .padding(.top, 4)
            
        }
    }
}
